import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/features/members/presentation/provider/update_member/update_member_notifier.dart';
import 'package:gym_management_system/features/members/presentation/provider/update_member/update_member_state.dart';

import '../../../../../core/di/service_locator.dart';

final updateMemberNotifierProvider =
    StateNotifierProvider<UpdateMemberNotifier, UpdateMemberState>(
      (ref) => sl<UpdateMemberNotifier>(),
    );
