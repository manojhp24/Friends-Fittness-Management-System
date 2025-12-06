import 'package:flutter/material.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../../../core/extensions/extensions.dart';

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: scheme.primary.withValues(alpha: 0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: scheme.surface,
            backgroundImage: const AssetImage(
              "assets/images/app_logo/app_logo.png",
            ),
          ),
        ),
        SizedBox(height: AppSizes.spaceL(context)),
        Text(
          "Welcome Back!",
          style: Theme.of(context).textTheme.headlineLarge!.extraBold.copyWith(
            letterSpacing: 0.5,
            color: scheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Friends Fitness",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: scheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Log in to manage your gym members",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
