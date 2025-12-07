import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/config/app_sizes.dart';

import '../../presentation/provider/auth_provider.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/login_screen_header.dart';
import 'loading_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);

    if (state.isLoading) {
      return const LoadingScreen();
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                const LoginScreenHeader(),
                SizedBox(height: AppSizes.sectionSpace(context) * 2.5),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
