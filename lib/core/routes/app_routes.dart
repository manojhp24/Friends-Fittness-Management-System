import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/features/authentication/presentation/pages/loading_screen.dart';
import 'package:gym_management_system/features/authentication/presentation/pages/login_screen.dart';
import 'package:gym_management_system/features/dashboard/presentation/pages/dashboard.dart';

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
  final notifier = ref.read(routerNotifierProvider);
  return GoRouter(
    refreshListenable: notifier,
    initialLocation: '/login',

    redirect: (context, state) {
      final authState = ref.watch(authNotifierProvider);

      final isLoggedIn = authState.user != null;
      final isOnLoginPage = state.matchedLocation == '/login';

      if (!isLoggedIn && !isOnLoginPage) {
        return '/login';
      }

      if (isLoggedIn && isOnLoginPage) {
        return '/dashboard';
      }

      return null;
    },

    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/dashboard', builder: (_, __) => const Dashboard()),
      GoRoute(path: '/loading', builder: (_, __) => const LoadingScreen()),
    ],
  );
});
