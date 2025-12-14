import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';
import 'package:gym_management_system/core/validators/auth_validators.dart';
import 'package:gym_management_system/core/widgets/custom_app_bar.dart';
import 'package:gym_management_system/features/authentication/presentation/provider/auth_provider.dart';
import 'package:gym_management_system/features/members/presentation/widgets/shared/custom_input_field.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/widgets/app_snackbar.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(
      debugLabel: '_forgotScreen');



  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider, (prev, next) {
      if (prev?.error != next.error && next.error != null) {
        AppSnackBar.error(context, next.error!);
      }

      if (prev?.successMessage != next.successMessage && next.successMessage != null) {
        AppSnackBar.success(context, next.successMessage!);
      }
    });

    return Scaffold(
      appBar: CustomAppBar(title: "", showBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.screenPadding(context) * 2),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.lock_reset, size: 80),
                SizedBox(height: AppSizes.spaceL(context)),

                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: AppSizes.spaceM(context)),
                Text(
                  "Enter your registered email address. We'll send you a reset link to recover your account.",
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
                SizedBox(height: 30),

                // Email Field
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomInputField(
                        controller: authNotifier.resetEmailController,
                        validator: (email) =>
                            AuthValidators.validateEmail(email!),
                        label: "Email",
                        prefixIcon: Icon(
                          Iconsax.sms,
                          size: AppSizes.iconSize(context),
                        ),
                      ),
                      SizedBox(height: AppSizes.spaceL(context) * 1.2),

                      // Reset Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (authState.isResetLoading) return;
                            if (!formKey.currentState!.validate()) {
                              AppSnackBar.error(
                                context,
                                "Please enter valid email",
                              );
                              return;
                            }
                            authNotifier.sendResetEmail();
                          },
                          child: authState.isResetLoading
                              ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                              : Text("Send Reset Link"),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
