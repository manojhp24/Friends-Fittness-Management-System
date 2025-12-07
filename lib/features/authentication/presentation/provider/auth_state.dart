import '../../domain/entities/user_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final String? successMessage;
  final UserEntity? user;

  const AuthState({
    this.isLoading = false,
    this.error,
    this.successMessage,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? successMessage,
    UserEntity? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      successMessage: successMessage,
      user: user ?? this.user,
    );
  }
}
