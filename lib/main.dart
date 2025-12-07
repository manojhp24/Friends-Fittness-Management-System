import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/core/network/network_info.dart';
import 'package:gym_management_system/core/services/firebase_initializer.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Firebase first (registers plugins)
  await FirebaseInitializer.init();

  // 2. Initialize GetIt dependencies
  await initServiceLocator();


  runApp(ProviderScope(child: MyApp()));
}
