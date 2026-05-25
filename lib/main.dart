import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/core/services/firebase_initializer.dart';
import 'package:gym_management_system/core/services/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));

  await FirebaseInitializer.init();

  await initServiceLocator();

  await sl<NotificationService>().init();

  runApp(ProviderScope(child: MyApp()));
}
