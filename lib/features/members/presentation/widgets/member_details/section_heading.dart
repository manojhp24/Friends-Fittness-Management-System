import 'package:flutter/material.dart';
import '../../../../../core/config/app_sizes.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionHeading({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.spaceM(context),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: AppSizes.iconSize(context) * 0.9,
            color: scheme.primary,
          ),
          SizedBox(width: AppSizes.spaceS(context)),
          Text(
            title,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: scheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
