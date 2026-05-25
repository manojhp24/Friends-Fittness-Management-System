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
        splashColor: scheme.primary.withValues(alpha: 0.12),
        highlightColor: scheme.primary.withValues(alpha: 0.08),
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.spaceM(context),
            horizontal: AppSizes.cardPadding(context),
          ),
          decoration: BoxDecoration(
            color: scheme.surfaceContainer,
            borderRadius: BorderRadius.circular(AppSizes.radius(context)),
            border: Border.all(
              color: scheme.outlineVariant.withValues(alpha: 0.5),
              width: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: scheme.primary.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: scheme.primary,
                size: AppSizes.buttonIconSize(context),
              ),
              SizedBox(width: AppSizes.spaceS(context) * 1.2),
              Flexible(
                child: Text(
                  label,
                  style: textTheme.labelLarge?.copyWith(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.05,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
