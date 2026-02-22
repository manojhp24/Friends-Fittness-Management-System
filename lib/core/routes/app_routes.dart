import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management_system/features/authentication/presentation/pages/forgot_password_screen.dart';
import 'package:gym_management_system/features/authentication/presentation/pages/login_screen.dart';
import 'package:gym_management_system/features/dashboard/presentation/pages/dashboard.dart';
import 'package:gym_management_system/features/dashboard/presentation/pages/main_screen.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/presentation/pages/add_member_screen.dart';
import 'package:gym_management_system/features/members/presentation/pages/member_renew_screen.dart';
import 'package:gym_management_system/features/members/presentation/pages/members_screen.dart';

import '../../features/authentication/presentation/provider/auth_provider.dart';
import '../../features/members/presentation/pages/member_detail_screen.dart';

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

      final loggedIn = authState.user != null;
      final location = state.uri.toString();

      final onLogin = location.startsWith('/login');
      final onForgot = location.startsWith('/forgot-password');

      if (!loggedIn) {
        if (onLogin || onForgot) return null;
        return '/login';
      }

      if (loggedIn && onLogin) return '/main-screen';

      return null;
    },

    routes: [

      // ---------------- AUTH ----------------
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/forgot-password',
          builder: (_, __) => const ForgotPasswordScreen()),

      // ---------------- MAIN SCREENS ----------------
      GoRoute(path: '/main-screen', builder: (_, __) => const MainScreen()),
      GoRoute(path: '/dashboard', builder: (_, __) => const Dashboard()),

      // ---------------- MEMBERS ----------------
      GoRoute(path: '/members', builder: (_, __) => const MembersScreen()),

      GoRoute(
        path: '/member-details',
        builder: (context, state) =>
            MemberDetailScreen(
              member: state.extra as MemberEntity,
            ),
      ),

      GoRoute(
        path: '/add-member',
        builder: (_, __) => AddMemberScreen(),
      ),

      GoRoute(
        path: '/update-member',
        builder: (context, state) =>
            AddMemberScreen(
              member: state.extra as MemberEntity,
            ),
      ),

      GoRoute(path: "/renew-member",
          builder: (context, state) =>
              MemberRenewScreen(member: state.extra as MemberEntity)),
    ],
  );
});
