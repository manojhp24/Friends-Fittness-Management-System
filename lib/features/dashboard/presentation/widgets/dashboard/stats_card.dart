import 'package:flutter/material.dart';

import '../../../../../core/config/app_sizes.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.containerColor,
    required this.textTheme,
    required this.value,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.subTitleColor,
    required this.iconColor,
    required this.onTap,
  });

  final Color containerColor;
  final Color subTitleColor;
  final Color iconColor;
  final TextTheme textTheme;
  final String value;
  final String title;
  final String subTitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radius(context)),
      child: Ink(
        padding: EdgeInsets.all(AppSizes.cardPadding(context)),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(AppSizes.radius(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: AppSizes.iconSize(context) * 1.4,
              color: iconColor,
            ),

            const Spacer(),

            Text(
              value,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),

            SizedBox(height: AppSizes.spaceS(context) * 0.2),

            Text(
              title,
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: subTitleColor,
              ),
            ),
            SizedBox(height: AppSizes.spaceS(context) * 0.2),

            Text(subTitle, style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
