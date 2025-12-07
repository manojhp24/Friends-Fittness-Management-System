import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/di/service_locator.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => sl<AuthNotifier>(),
);
