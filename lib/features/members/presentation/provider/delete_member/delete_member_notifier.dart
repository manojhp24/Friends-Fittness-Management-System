import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/usecases/delete_member_use_case.dart';
import 'package:gym_management_system/features/members/presentation/provider/delete_member/delete_member_state.dart';

class DeleteMemberNotifier extends StateNotifier<DeleteMemberState> {
  final DeleteMemberUseCase _deleteMemberUseCase;

  DeleteMemberNotifier(this._deleteMemberUseCase)
    : super(DeleteMemberState.initial());

  Future<void> deleteMember(String memberId) async {
    state = state.copyWith(isLoading: true);

    final result = await _deleteMemberUseCase(memberId);

    if (result is DataSuccess<void>) {
      state = state.copyWith(isLoading: false, isSuccess: true);
    }else{
      state = state.copyWith(isLoading: false,isSuccess: false,error: result.message);
    }
  }
}
