import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/usecases/add_member_use_case.dart';
import 'package:gym_management_system/features/members/presentation/provider/add_member/add_member_state.dart';

class AddMemberNotifier extends StateNotifier<AddMemberState> {
  final AddMemberUseCase _addMemberUseCase;

  AddMemberNotifier(this._addMemberUseCase) : super(AddMemberState.initial());

  Future<void> addMember(MemberEntity member) async {
    state = state.copyWith(isLoading: true);

    final result = await _addMemberUseCase(member);

    if (result is DataSuccess) {
      state = state.copyWith(isLoading: false, successId: result.data);
    } else {
      state = state.copyWith(isLoading: false, error: result.message);
    }
  }
}
