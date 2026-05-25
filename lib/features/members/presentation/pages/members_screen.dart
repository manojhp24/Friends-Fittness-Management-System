import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/core/helpers/calculate_days_left.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_provider.dart';
import 'package:gym_management_system/features/members/presentation/widgets/tiles/member_list.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../provider/member_search_provider.dart';
import '../utils/member_filter.dart';
import '../widgets/search/member_search_bar.dart';

class MembersScreen extends ConsumerWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    final state = ref.watch(memberListNotifierProvider);
    final search = ref.watch(memberSearchProvider);

    if (state.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (state.error != null) {
      return Scaffold(
        body: Center(
          child: Text(state.error!, style: const TextStyle(color: Colors.red)),
        ),
      );
    }

    final members = filterMember(state.members, search);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Members",
          showBack: false,
          titleSpacing: 16,
          bottom: TabBar(
            isScrollable: false,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.zero,
            indicatorWeight: 3,

            tabs: const [
              Tab(text: "All"),
              Tab(text: "Active"),
              Tab(text: "Expired"),
            ],
          ),
        ),

        body: Column(
          children: [
            const MemberSearchBar(),

            Expanded(
              child: TabBarView(
                children: [
                  MembersList(members: members),

                  MembersList(
                    members: members.where((m) => m.isActive).toList(),
                  ),

                  MembersList(
                    members: members
                        .where((m) => calculateDaysLeft(m.expiryDate) <= 0)
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: scheme.primaryContainer,
          child: Icon(Icons.add, color: scheme.onPrimaryContainer),
          onPressed: () => context.push('/add-member'),
        ),
      ),
    );
  }
}
