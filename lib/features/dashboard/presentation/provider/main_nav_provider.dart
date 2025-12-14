import 'package:flutter_riverpod/legacy.dart';

import 'main_nav_notifier.dart';
import 'main_nav_state.dart';

final mainNavProvider = StateNotifierProvider<MainNavNotifier, MainNavState>((
  ref,
) {
  return MainNavNotifier();
});
