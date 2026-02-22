class RenewMemberState {
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const RenewMemberState({
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  factory RenewMemberState.initial() =>
      const RenewMemberState();

  RenewMemberState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return RenewMemberState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}