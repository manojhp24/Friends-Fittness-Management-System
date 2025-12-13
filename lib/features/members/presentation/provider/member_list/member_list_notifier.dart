import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/usecases/get_member_use_case.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_state.dart';

class MemberListNotifier extends StateNotifier<MemberListState> {
  final GetMembersUseCase _getMembersUseCase;

  MemberListNotifier(this._getMembersUseCase)
    : super(MemberListState.initial()) {
    getMembers();
  }

  Future<void> getMembers() async {
    state = state.copyWith(isLoading: true);

    final result = await _getMembersUseCase();

    if (result is DataSuccess) {
      state = state.copyWith(isLoading: false, members: result.data ?? []);
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.message ?? 'Failed to load members',
      );
    }
  }
}
