import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/core/validators/auth_validators.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/config/app_sizes.dart';
import '../../../../../core/widgets/app_snackbar.dart';
import '../../../../members/presentation/widgets/shared/custom_input_field.dart';
import '../../provider/auth_provider.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final notifier = ref.read(authNotifierProvider.notifier);


    ref.listen(authNotifierProvider, (prev, next) {
      if (next.error != null) {
        AppSnackBar.error(context, next.error!);
      }

      if (next.successMessage != null) {
        AppSnackBar.success(context, next.successMessage!);
      }
    });


    return Form(
      key: notifier.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputField(
            controller: notifier.emailController,
            validator: (email) => AuthValidators.validateEmail(email!),
            label: "Email",
            prefixIcon: Icon(
              Iconsax.sms,
              color: scheme.primary,
              size: AppSizes.inputIconSize(context),
            ),
          ),
          SizedBox(height: AppSizes.spaceL(context)),
          CustomInputField(
            controller: notifier.passwordController,
            validator: (password) => AuthValidators.validatePassword(password!),
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
              onPressed: () async {
                notifier.login();
              },
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
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
