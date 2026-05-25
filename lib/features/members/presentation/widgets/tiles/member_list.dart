import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/features/members/presentation/widgets/shared/empty_state_widget.dart';
import 'package:gym_management_system/features/members/presentation/widgets/tiles/member_tile.dart';
import 'package:intl/intl.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../../../core/helpers/calculate_days_left.dart';
import '../../../domain/entities/member_entity.dart';

class MembersList extends StatelessWidget {
  final List<MemberEntity> members;

  const MembersList({super.key, required this.members});

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) {
      return const EmptyStateWidget(
        icon: Icons.group_off,
        emptyMessage: "No members found",
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(AppSizes.screenPadding(context)),
      itemCount: members.length,
      separatorBuilder: (_, _) =>
          SizedBox(height: AppSizes.spaceM(context)),
      itemBuilder: (context, index) {
        final m = members[index];

        return MemberTile(
          onTap: () => context.push('/member-details', extra: m),
          name: m.fullName,
          mobile: '+91-${m.mobileNumber}',
          plan: m.membership,
          expiryDate:
          DateFormat("MMM d, yyyy").format(m.expiryDate),
          daysLeft: calculateDaysLeft(m.expiryDate).toString(),
          status: m.isActive ? "Active" : "Inactive",
        );
      },
    );
  }
}