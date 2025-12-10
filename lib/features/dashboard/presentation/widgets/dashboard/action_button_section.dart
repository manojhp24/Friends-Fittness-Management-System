import 'package:flutter/material.dart';

import '../../../../../core/config/app_sizes.dart';
import 'action_button.dart';

class ActionButtonSection extends StatelessWidget {
  const ActionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ActionButton(
                icon: Icons.person_add_rounded,
                label: "Add Member",
                onTap: () {},
              ),
            ),
            SizedBox(width: AppSizes.spaceM(context)),
            Expanded(
              child: ActionButton(
                icon: Icons.event_rounded,
                label: "Schedule",
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.spaceM(context)),
        Row(
          children: [
            Expanded(
              child: ActionButton(
                icon: Icons.payments_rounded,
                label: "Payments",
                onTap: () {},
              ),
            ),
            SizedBox(width: AppSizes.spaceM(context)),
            Expanded(
              child: ActionButton(
                icon: Icons.receipt_long_rounded,
                label: "Reports",
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
