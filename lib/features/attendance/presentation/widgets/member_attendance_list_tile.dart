import 'package:flutter/material.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';

class MemberAttendanceLIstTile extends StatelessWidget {
  final MemberEntity member;
  final bool isPresent;
  final ValueChanged<bool?> onChanged;

  const MemberAttendanceLIstTile({
    super.key,
    required this.member,
    required this.onChanged,
    required this.isPresent,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: scheme.surfaceContainerLow,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: scheme.primaryContainer,
          child: Text(
            member.fullName.substring(0, 2).toUpperCase(),
            style: TextStyle(color: scheme.onPrimaryContainer, fontSize: 14),
          ),
        ),
        title: Text(
          member.fullName,
          style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          member.membership,
          style: textTheme.bodySmall!.copyWith(color: scheme.onSurfaceVariant),
        ),
        trailing: Checkbox(value: isPresent, onChanged: onChanged),
      ),
    );
  }
}
