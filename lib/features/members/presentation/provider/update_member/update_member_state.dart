class UpdateMemberState {
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  UpdateMemberState({
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  factory UpdateMemberState.initial() => UpdateMemberState();

  UpdateMemberState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return UpdateMemberState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
