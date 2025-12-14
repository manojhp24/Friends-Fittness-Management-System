import 'package:flutter_riverpod/legacy.dart';
import 'package:gym_management_system/features/dashboard/presentation/provider/main_nav_state.dart';

class MainNavNotifier extends StateNotifier<MainNavState> {
  MainNavNotifier() : super(const MainNavState());

  void changePage(int newIndex) {
    state = state.copyWith(index: newIndex);
  }
}
