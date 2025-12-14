import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/authentication/domain/entities/login_credentials.dart';
import 'package:gym_management_system/features/authentication/domain/entities/user_entity.dart';
import 'package:gym_management_system/features/authentication/domain/usecases/forgot_password_usecase.dart';
import 'package:gym_management_system/features/authentication/domain/usecases/login_usecase.dart';

import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;

  AuthNotifier(this._loginUseCase, this._forgotPasswordUsecase)
      : super(AuthState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final resetEmailController = TextEditingController();

  /// Login

  Future<void> login() async {
    state = state.copyWith(isLoading: true);

    final result = await _loginUseCase(
      LoginCredentials(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    if (result is DataSuccess) {
      state = state.copyWith(
        isLoading: false,
        user: result.data,
        successMessage: "Login Successful",
      );
      clearForm();
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.message ?? "Login failed",
      );
    }
  }

  Future<void> sendResetEmail() async {
    state = state.copyWith(
      isResetLoading: true,
      successMessage: null,
      error: null,
    );

    final result = await _forgotPasswordUsecase(resetEmailController.text.trim());

    if (result is DataSuccess) {
      state = state.copyWith(
        isResetLoading: false,
        successMessage: "Reset link sent to your email.",
      );

      resetEmailController.clear();
    } else {
      state = state.copyWith(
        isResetLoading: false,
        error: result.message ?? "Failed to send reset email.",
      );
    }
  }


  Future<void> checkAuthStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      state = state.copyWith(
        user: UserEntity(uid: user.uid, email: user.email!),
      );
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();

    state = const AuthState();
  }

  void clearForm() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    resetEmailController.dispose();
    super.dispose();
  }

  void togglePassword() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void clearMessages() {
    state = state.copyWith(error: null, successMessage: null);
  }
}
