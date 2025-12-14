import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';

class MemberListState {
  final bool isLoading;
  final String? error;
  final List<MemberEntity> members;

  const MemberListState({
    this.isLoading = false,
    this.error,
    this.members = const [],
  });

  factory MemberListState.initial() => MemberListState();

  MemberListState copyWith({
    bool? isLoading,
    String? error,
    List<MemberEntity>? members,
  }) {
    return MemberListState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      members: members ?? this.members,
    );
  }
}
