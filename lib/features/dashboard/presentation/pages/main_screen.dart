import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/helpers/theme_helpers.dart';
import 'package:gym_management_system/features/members/presentation/pages/members_screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../provider/main_nav_provider.dart';
import 'dashboard.dart';

// Dummy screens
final screens = [
  Dashboard(),
  MembersScreen(),
  Center(child: Text("Attendance Screen")),
  Center(child: Text("Settings Screen")),
];

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navState = ref.watch(mainNavProvider);
    final notifier = ref.read(mainNavProvider.notifier);
    final scheme = ThemeHelpers.scheme(context);

    return Scaffold(
      body: screens[navState.index],
      bottomNavigationBar: NavigationBar(
        backgroundColor: scheme.surface,
        indicatorColor: scheme.primaryContainer,
        selectedIndex: navState.index,
        onDestinationSelected: notifier.changePage,
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(icon: Icon(Iconsax.people), label: "Members"),
          NavigationDestination(icon: Icon(Iconsax.calendar_tick), label: "Attendance"),
          NavigationDestination(icon: Icon(Iconsax.setting), label: "Settings"),
        ],
      ),
    );
  }
}
