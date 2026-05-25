import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/usecases/get_member_use_case.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_state.dart';

class MemberListNotifier extends StateNotifier<MemberListState> {
  final GetMembersUseCase _getMembersUseCase;
  StreamSubscription? _streamSubscription ;

  MemberListNotifier(this._getMembersUseCase)
    : super(MemberListState.initial()) {
    _listenMembers();
  }

  void _listenMembers(){
    state = state.copyWith(isLoading: true);

    _streamSubscription = _getMembersUseCase().listen((result) {
      if(result is DataSuccess){
        state = state.copyWith(
          isLoading: false,
          members: result.data ?? [],
          error: null
        );
      }else if(result is DataFailed){
        state = state.copyWith(
          isLoading: false,
          error: result.message ?? "Something went wrong"
        );
      }
    });
  }

  @override
  void dispose(){
    _streamSubscription?.cancel();
    super.dispose();
  }

}
