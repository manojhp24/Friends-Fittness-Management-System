import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/features/authentication/presentation/pages/forgot_password_screen.dart';
import 'package:gym_management_system/features/authentication/presentation/pages/login_screen.dart';
import 'package:gym_management_system/features/dashboard/presentation/pages/dashboard.dart';
import 'package:gym_management_system/features/dashboard/presentation/pages/main_screen.dart';
import 'package:gym_management_system/features/members/presentation/pages/members_screen.dart';

import '../../features/authentication/presentation/provider/auth_provider.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  RouterNotifier(this.ref) {
    ref.listen(authNotifierProvider, (_, __) => notifyListeners());
  }
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    refreshListenable: notifier,
    initialLocation: '/main-screen',

    redirect: (context, state) {
      final authState = ref.watch(authNotifierProvider);

      final isLoggedIn = authState.user != null;
      final isOnLoginPage = state.uri.toString().startsWith('/login');
      final isOnForgotPage = state.uri.toString().startsWith('/forgot-password');

      if (!isLoggedIn) {
        if (isOnLoginPage || isOnForgotPage) return null;
        return '/login';
      }

      // Only redirect login screen for authenticated users
      if (isLoggedIn && isOnLoginPage) {
        return '/main-screen';
      }

      return null;
    },



    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/dashboard', builder: (_, __) => const Dashboard()),
      GoRoute(path: '/members', builder: (_, __) => const MembersScreen()),
      GoRoute(path: '/main-screen', builder: (_, __) => const MainScreen()),
      GoRoute(path: '/forgot-password',
          builder: (_, __) => const ForgotPasswordScreen()),
    ],
  );
});

