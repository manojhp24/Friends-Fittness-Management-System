import 'package:flutter/material.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';

import '../widgets/login/login_form.dart';
import '../widgets/login/login_screen_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),

                // App logo and title section
                LoginScreenHeader(),

                SizedBox(height: AppSizes.sectionSpace(context) * 2.5),

                // Email + password fields and actions
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
