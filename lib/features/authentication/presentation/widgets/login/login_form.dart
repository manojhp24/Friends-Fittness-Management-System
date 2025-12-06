import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../../members/presentation/widgets/shared/custom_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputField(
            label: "Email",
            prefixIcon: Icon(
              Iconsax.sms,
              color: scheme.primary,
              size: AppSizes.inputIconSize(context),
            ),
          ),
          SizedBox(height: AppSizes.spaceL(context)),
          CustomInputField(
            label: "Password",
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.eye_slash,
                color: scheme.primary,
                size: AppSizes.inputIconSize(context),
              ),
            ),
            prefixIcon: Icon(
              Iconsax.lock,
              color: scheme.primary,
              size: AppSizes.inputIconSize(context),
            ),
          ),
          SizedBox(height: AppSizes.spaceM(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceL(context)),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: scheme.primary,
                foregroundColor: scheme.onPrimary,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radius(context)),
                ),
              ),
              child: Text(
                "Log In",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: scheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceL(context)),
          Row(
            children: [
              Expanded(
                child: Divider(color: scheme.outlineVariant, thickness: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "OR",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Divider(color: scheme.outlineVariant, thickness: 1),
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceL(context)),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: scheme.outline, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radius(context)),
                ),
              ),
              icon: Icon(
                Iconsax.google_1,
                color: scheme.onSurface,
                size: AppSizes.buttonIconSize(context),
              ),
              label: Text(
                "Continue with Google",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: scheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.sectionSpace(context) * 2),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
