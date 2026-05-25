import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../domain/entities/member_entity.dart';

class MemberHeader extends StatelessWidget {
  final MemberEntity member;

  const MemberHeader({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        CircleAvatar(
          radius: AppSizes.spaceL(context) * 1.35,
          backgroundColor:
          isDark ? scheme.primaryContainer : scheme.primary,
          child: Text(
            member.fullName[0].toUpperCase(),
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color:
              isDark ? scheme.onPrimaryContainer : scheme.onPrimary,
            ),
          ),
        ),
        SizedBox(width: AppSizes.spaceM(context)),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(member.fullName,
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600)),

              Row(
                children: [
                  Expanded(
                    child: Text("#ID:${member.id}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall),
                  ),

                  IconButton(
                    icon: const Icon(Icons.copy, size: 16),
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: member.id),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("ID copied")),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),

        Chip(
          backgroundColor: member.isActive
              ? scheme.secondaryContainer
              : scheme.errorContainer,
          label: Text(member.isActive ? "Active" : "Inactive"),
        ),
      ],
    );
  }
}