import 'package:flutter/material.dart';
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

  // 3. Test network after plugins are ready
  final networkInfo = sl<NetworkInfo>();
  final isConnected = await networkInfo.isConnected;

  print(isConnected
      ? "🌍 Internet Available"
      : "🚫 No Internet Connection");

  runApp(const MyApp());
}
