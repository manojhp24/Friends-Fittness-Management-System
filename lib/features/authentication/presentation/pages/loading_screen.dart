import 'package:flutter/material.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSizes.screenPadding(context)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                "assets/animation/loading.json",
                width: 200,
                height: 200,
                repeat: true,
              ),


              Text(
                "Signing you in...",
                style: theme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: scheme.primary,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: AppSizes.spaceS(context)),

              Text(
                "Please wait a moment",
                style: theme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
