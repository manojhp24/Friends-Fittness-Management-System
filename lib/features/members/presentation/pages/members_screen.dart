import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/core/helpers/calculate_days_left.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_provider.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../provider/member_search_provider.dart';
import '../widgets/shared/empty_state_widget.dart';
import '../widgets/shared/search_bar.dart';
import '../widgets/tiles/member_tile.dart';

class MembersScreen extends ConsumerWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    final state = ref.watch(memberListNotifierProvider);
    final search = ref.watch(memberSearchProvider);

    /// 🔍 FILTERED MEMBERS
    final filteredMembers = state.members.where((m) {
      return m.fullName.toLowerCase().contains(search.toLowerCase()) ||
          m.mobileNumber.contains(search);
    }).toList();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Members",
          showBack: false,
          titleSpacing: 16,
          bottom: TabBar(
            isScrollable: true,
            padding: EdgeInsets.zero,
            tabs: [
              Tab(text: "All"),
              Tab(text: "Active"),
              Tab(text: "Inactive"),
              Tab(text: "Expired"),
            ],
          ),
        ),

        body: SafeArea(
          child: Column(
            children: [
              MemberSearchBar(),

              /// 📑 TABS CONTENT
              Expanded(
                child: Builder(
                  builder: (_) {
                    if (state.isLoading) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: CircularProgressIndicator(strokeWidth: 3),
                        ),
                      );
                    }

                    if (state.error != null) {
                      return Center(
                        child: Text(
                          state.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    return TabBarView(
                      children: [
                        _buildMembersListWithRefresh(
                          context,
                          ref,
                          filteredMembers,
                        ),

                        _buildMembersListWithRefresh(
                          context,
                          ref,
                          filteredMembers
                              .where((m) => m.isActive)
                              .toList(),
                        ),

                        _buildMembersListWithRefresh(
                          context,
                          ref,
                          filteredMembers
                              .where((m) => !m.isActive)
                              .toList(),
                        ),

                        _buildMembersListWithRefresh(
                          context,
                          ref,
                          filteredMembers
                              .where(
                                (m) =>
                            calculateDaysLeft(m.expiryDate) <= 0,
                          )
                              .toList(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: scheme.primaryContainer,
          child: Icon(Icons.add, color: scheme.onPrimaryContainer),
          onPressed: () async {
            final added = await context.push('/add-member');
            if (added == true) {
              ref
                  .read(memberListNotifierProvider.notifier)
                  .getMembers();
            }
          },
        ),
      ),
    );
  }
}


/// ================= HELPERS =================

Widget _buildMembersList(BuildContext context,
    WidgetRef ref,
    List members,) {
  if (members.isEmpty) {
    return const EmptyStateWidget(
      icon: Icons.group_off,
      emptyMessage: "No members found",
    );
  }

  return Scrollbar(
    radius: const Radius.circular(12),
    thickness: 4,
    child: ListView.separated(
      padding: EdgeInsets.all(AppSizes.screenPadding(context)),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: members.length,
      separatorBuilder: (_, __) =>
          SizedBox(height: AppSizes.spaceM(context)),
      itemBuilder: (context, index) {
        final member = members[index];
        final expiryDate =
        DateFormat("MMM d, yyyy").format(member.expiryDate);
        final daysLeft = calculateDaysLeft(member.expiryDate);

        return MemberTile(
          onTap: () async {
            final deleted = await context.push(
              '/member-details',
              extra: member,
            );
            if (deleted == true) {
              ref
                  .read(memberListNotifierProvider.notifier)
                  .getMembers();
            }
          },
          name: member.fullName,
          mobile: '+91-${member.mobileNumber}',
          plan: member.membership,
          expiryDate: expiryDate,
          daysLeft: daysLeft.toString(),
          status: member.isActive ? "Active" : "Inactive",
        );
      },
    ),
  );
}

Widget _buildMembersListWithRefresh(BuildContext context,
    WidgetRef ref,
    List members,) {
  return RefreshIndicator(
    onRefresh: () async {
      await ref.read(memberListNotifierProvider.notifier).getMembers();
    },
    child: _buildMembersList(context, ref, members),
  );
}
