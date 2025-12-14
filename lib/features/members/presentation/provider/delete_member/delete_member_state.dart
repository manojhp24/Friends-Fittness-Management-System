class DeleteMemberState {
  final bool isLoading;
  final bool? isSuccess;
  final String? error;

  DeleteMemberState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  factory DeleteMemberState.initial() => DeleteMemberState();

  DeleteMemberState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return DeleteMemberState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
