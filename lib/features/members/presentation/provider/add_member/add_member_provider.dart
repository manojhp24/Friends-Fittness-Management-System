import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/features/members/presentation/provider/add_member/add_member_notifier.dart';
import 'package:gym_management_system/features/members/presentation/provider/add_member/add_member_state.dart';

final addMemberNotifierProvider =
    StateNotifierProvider<AddMemberNotifier, AddMemberState>(
      (ref) => sl<AddMemberNotifier>(),
    );
