import '../../domain/entities/user_entity.dart';

class AuthState {
  final bool isLoading;
  final bool isResetLoading;
  final String? error;
  final String? successMessage;
  final UserEntity? user;
  final bool isPasswordVisible;

  const AuthState({
    this.isLoading = false,
    this.isResetLoading = false,
    this.error,
    this.successMessage,
    this.user,
    this.isPasswordVisible = false,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isResetLoading,
    String? error,
    String? successMessage,
    UserEntity? user,
    bool? isPasswordVisible,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isResetLoading: isResetLoading ?? this.isResetLoading,
      error: error,
      successMessage: successMessage,
      user: user ?? this.user,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
