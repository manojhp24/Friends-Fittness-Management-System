import 'package:flutter/material.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/core/extensions/extensions.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;

  const CustomInputField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return TextField(
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyMedium?.responsive,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.responsive
            .copyWith(color: scheme.onSurfaceVariant),

        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.4),

        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.cardPadding,
          vertical: AppSizes.spaceM * 1.2,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius*0.4),
          borderSide: BorderSide(
            color: scheme.outline.withValues(alpha: 0.4),
            width: 1.3,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius),
          borderSide: BorderSide(
            color: scheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
