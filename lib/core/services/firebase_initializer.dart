import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../../firebase_options.dart';

class FirebaseInitializer {
  FirebaseInitializer._();

  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      _log("Firebase connected successfully");
    } catch (e) {
      _log("Firebase connection failed: $e");
    }
  }

  static void _log(String message) {
    if (kDebugMode) print(message);
  }
}
