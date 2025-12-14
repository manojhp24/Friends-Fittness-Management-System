import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/core/helpers/calculate_days_left.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_provider.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/shared/empty_state_widget.dart';
import '../widgets/tiles/member_tile.dart';

class MembersScreen extends ConsumerWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final state = ref.watch(memberListNotifierProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Members",
        showBack: false,
        titleSpacing: 16.0,
        actions: [
          IconButton(icon: const Icon(Icons.search_rounded), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.filter_list_rounded), onPressed: () {}),
        ],
      ),

      body: SafeArea(
        child: RefreshIndicator(
          color: scheme.primary,
          backgroundColor: scheme.surfaceContainerHigh,
          onRefresh: () async {
            await ref.read(memberListNotifierProvider.notifier).getMembers();
          },

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


              if (state.members.isEmpty) {
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
                  itemCount: state.members.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(height: AppSizes.spaceM(context)),
                  itemBuilder: (context, index) {
                    final member = state.members[index];
                    final expiryDate = DateFormat("MMM d, yyyy").format(
                        member.expiryDate);
                    final daysLeft = calculateDaysLeft(member.expiryDate);
                    return MemberTile(
                      onTap: () {
                        context.push('/member-details', extra: member);
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
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: scheme.primaryContainer,
        child: Icon(Icons.add, color: scheme.onPrimaryContainer),
        onPressed: () async {
          final added = await context.push('/add-member');

          if (added == true) {
            ref.read(memberListNotifierProvider.notifier).getMembers();
          }
        },
      ),
    );
  }
}
