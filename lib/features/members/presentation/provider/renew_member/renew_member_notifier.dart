import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/features/members/presentation/provider/renew_member/renew_member_state.dart';

import '../../../../../core/utils/data_state.dart';
import '../../../domain/usecases/renew_member_usecase.dart';

class RenewMemberNotifier
    extends StateNotifier<RenewMemberState> {

  final RenewMemberUsecase _renewMemberUseCase;

  RenewMemberNotifier(this._renewMemberUseCase)
      : super(RenewMemberState.initial());

  Future<void> renew(RenewParams params) async {

    state = state.copyWith(isLoading: true);

    final result = await _renewMemberUseCase(params);

    if (result is DataSuccess) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.message,
      );
    }
  }
}