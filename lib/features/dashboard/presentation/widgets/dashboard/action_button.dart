import 'package:flutter/material.dart';

import '../../../../../core/config/app_sizes.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radius(context)),
        splashColor: scheme.primary.withValues(alpha: 0.1),
        highlightColor: scheme.primary.withValues(alpha: 0.05),
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.spaceM(context),
            horizontal: AppSizes.cardPadding(context),
          ),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(AppSizes.radius(context)),
            border: Border.all(color: scheme.outlineVariant, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: scheme.primary,
                size: AppSizes.buttonIconSize(context),
              ),
              SizedBox(width: AppSizes.spaceS(context)),
              Text(
                label,
                style: textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurface,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
