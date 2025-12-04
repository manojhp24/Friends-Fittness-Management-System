import 'package:flutter/material.dart';
import 'package:gym_management_system/core/theme/app_theme.dart';
import 'package:gym_management_system/features/members/presentation/pages/members_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const MembersScreen(),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

    );
  }
}
