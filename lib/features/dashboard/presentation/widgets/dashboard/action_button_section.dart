import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_sizes.dart';
import 'action_button.dart';

class ActionButtonSection extends StatelessWidget {
  const ActionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final space = AppSizes.spaceM(context);

    return Column(
      children: [
        // Primary action row
        Row(
          children: [
            Expanded(
              child: ActionButton(
                icon: Icons.person_add_rounded,
                label: "Add Member",
                onTap: () => context.push("/add-member"),
              ),
            ),
            SizedBox(width: space),
            Expanded(
              child: ActionButton(
                icon: Icons.group_rounded,
                label: "Members",
                onTap: () => context.push("/members"),
              ),
            ),
          ],
        ),

        SizedBox(height: space),

        // Secondary action row
        Row(
          children: [
            Expanded(
              child: ActionButton(
                icon: Icons.autorenew_rounded,
                label: "Renew",
                onTap: () => context.push("/member-renew"),
              ),
            ),
            SizedBox(width: space),
            Expanded(
              child: ActionButton(
                icon: Icons.warning_amber_rounded,
                label: "Expiring",
                onTap: () => context.push("/members?filter=expiring"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
