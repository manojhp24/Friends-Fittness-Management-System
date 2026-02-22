import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/usecases/update_member_use_case.dart';
import 'package:gym_management_system/features/members/presentation/provider/update_member/update_member_state.dart';

class UpdateMemberNotifier extends StateNotifier<UpdateMemberState> {
  final UpdateMemberUseCase updateMemberUseCase;

  UpdateMemberNotifier(this.updateMemberUseCase)
    : super(UpdateMemberState.initial());

  Future<void> updateMember(MemberEntity member) async {
    state = state.copyWith(isLoading: true);

    final result = await updateMemberUseCase(member);

    if (result is DataSuccess) {
      state = state.copyWith(isLoading: false, isSuccess: true);
    } else {
      state = state.copyWith(isLoading: false, error: result.message);
    }
  }
}
