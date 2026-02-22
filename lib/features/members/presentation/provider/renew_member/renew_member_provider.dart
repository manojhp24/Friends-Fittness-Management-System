import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/features/members/presentation/provider/renew_member/renew_member_notifier.dart';
import 'package:gym_management_system/features/members/presentation/provider/renew_member/renew_member_state.dart';

import '../../../../../core/di/service_locator.dart';

final renewalMemberNotifierProvider =
    StateNotifierProvider<RenewMemberNotifier, RenewMemberState>(
      (ref) => sl<RenewMemberNotifier>(),
    );
