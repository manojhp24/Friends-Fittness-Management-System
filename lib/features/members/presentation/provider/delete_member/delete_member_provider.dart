import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/features/members/presentation/provider/delete_member/delete_member_notifier.dart';
import 'package:gym_management_system/features/members/presentation/provider/delete_member/delete_member_state.dart';

final deleteMemberNotifierProvider =
    StateNotifierProvider<DeleteMemberNotifier, DeleteMemberState>(
      (ref) => sl<DeleteMemberNotifier>(),
    );
