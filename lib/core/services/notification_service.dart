import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._();

  factory NotificationService() => _instance;

  NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    try {
      const android = AndroidInitializationSettings("@mipmap/ic_launcher");
      const settings = InitializationSettings(android: android);
      await _plugin.initialize(settings: settings);

      // Create Android notification channel (required for Android 8+)
      await _createNotificationChannel();

      // Request notification permission
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();

      print("✓ Notification service initialized successfully");
    } catch (e) {
      print("✗ Notification initialization failed: $e");
      rethrow;
    }
  }

  Future<void> _createNotificationChannel() async {
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.createNotificationChannel(
      AndroidNotificationChannel(
        'expiry_channel',
        'Expiry Notifications',
        description: 'Notification for membership expiry alerts',
        importance: Importance.max,
        enableVibration: true,
        enableLights: true,
      ),
    );
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime date,
  }) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'expiry_channel',
        'Expiry Notifications',
        channelDescription: 'Notification for membership expiry',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        enableLights: true,
      );

      const notificationDetails = NotificationDetails(android: androidDetails);
      final scheduledDate = tz.TZDateTime.from(date, tz.local);

      print("📅 Scheduling notification: id=$id at $scheduledDate");

      await _plugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: scheduledDate,
        notificationDetails: notificationDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
      );

      print("✓ Notification scheduled successfully");
    } catch (e) {
      print("✗ Error scheduling notification: $e");
      rethrow;
    }
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'expiry_channel',
        'Expiry Notifications',
        channelDescription: 'Notification for membership expiry',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        enableLights: true,
      );
      const notificationDetails = NotificationDetails(android: androidDetails);

      print("📬 Showing notification: id=$id");

      await _plugin.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: notificationDetails,
      );

      print("✓ Notification shown successfully");
    } catch (e) {
      print("✗ Error showing notification: $e");
      rethrow;
    }
  }

  Future<void> cancelNotification(int id) async {
    try {
      await _plugin.cancel(id: id);
      print("🗑️ Cancelled notification: id=$id");
    } catch (e) {
      print("✗ Error cancelling notification: $e");
    }
  }
}
