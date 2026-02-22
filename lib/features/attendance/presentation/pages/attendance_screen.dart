import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import 'package:gym_management_system/features/attendance/presentation/provider/present_member_provider.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../widgets/member_attendance_list_tile.dart';

class AttendanceScreen extends ConsumerWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final state = ref.watch(memberListNotifierProvider);
    final presentMembers = ref.watch(presentMembersProvider);

    Set<String> selected = {"All"};

    return Scaffold(
      appBar: const CustomAppBar(title: "Attendance", showBack: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.screenPadding(context)),
          child: ListView(
            children: [
              /// Date Picker
              Card(
                elevation: 0,
                color: scheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: scheme.outline),
                ),
                child: const ListTile(
                  leading: Icon(Iconsax.calendar),
                  title: Text("Dec 16, 2025"),
                  trailing: Icon(Icons.arrow_drop_down),
                ),
              ),

              SizedBox(height: AppSizes.spaceM(context)),

              /// Search
              const SearchBar(
                leading: Icon(Icons.search),
                hintText: "Search member...",
              ),

              SizedBox(height: AppSizes.spaceM(context)),

              /// Filter
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: "All", label: Text("All")),
                  ButtonSegment(value: "Present", label: Text("Present")),
                  ButtonSegment(value: "Absent", label: Text("Absent")),
                ],
                selected: selected,
                onSelectionChanged: (_) {},
              ),

              SizedBox(height: AppSizes.spaceM(context)),

              /// MEMBERS / EMPTY STATE
              if (state.members.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Center(
                    child: Text(
                      "No members available",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: scheme.onSurfaceVariant),
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.members.length,
                  itemBuilder: (context, index) {
                    final member = state.members[index];

                    return MemberAttendanceLIstTile(
                      member: member,
                      isPresent: presentMembers.contains(member.id),
                      onChanged: (value) {
                        ref
                            .read(presentMembersProvider.notifier)
                            .update((set) {
                          final updated = {...set};
                          value == true
                              ? updated.add(member.id)
                              : updated.remove(member.id);
                          return updated;
                        });
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

