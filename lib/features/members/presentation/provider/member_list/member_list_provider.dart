import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_notifier.dart';
import 'package:gym_management_system/features/members/presentation/provider/member_list/member_list_state.dart';

final memberListNotifierProvider =
    StateNotifierProvider<MemberListNotifier, MemberListState>(
      (ref) => sl<MemberListNotifier>(),
    );
