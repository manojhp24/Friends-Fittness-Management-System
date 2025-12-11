class AddMemberState {
  final bool isLoading;
  final String? successId;
  final String? error;

  const AddMemberState({this.isLoading = false, this.successId, this.error});

  factory AddMemberState.initial() => const AddMemberState();

  AddMemberState copyWith({bool? isLoading, String? successId, String? error}) {
    return AddMemberState(
      isLoading: isLoading ?? this.isLoading,
      successId: successId,
      error: error,
    );
  }

  AddMemberState clearMessages() => AddMemberState(isLoading: isLoading);
}
