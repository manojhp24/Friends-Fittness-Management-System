import 'package:gym_management_system/core/services/notification_service.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';

import '../di/service_locator.dart';

class MemberNotificationService {
  final NotificationService _notificationService = sl<NotificationService>();

  // Generate deterministic ID from member ID to avoid collisions
  int _generateNotificationId(String memberId, int offset) {
    return memberId.hashCode + offset;
  }

  Future<void> scheduleExpiry(MemberEntity member) async {
    try {
      final now = DateTime.now();
      final expiry = member.expiryDate;

      // Calculate alert times
      // Tomorrow alert: 1 day before expiry at 9 AM
      final expiryAt9Am = DateTime(expiry.year, expiry.month, expiry.day, 9);

      var tomorrowAlert = expiryAt9Am.subtract(const Duration(days: 1));
      var expiryAlert = expiryAt9Am;

      // If alerts are in the past, schedule them in the near future for testing
      if (tomorrowAlert.isBefore(now)) {
        tomorrowAlert = now.add(const Duration(minutes: 1));
      }
      if (expiryAlert.isBefore(now)) {
        expiryAlert = now.add(const Duration(minutes: 2));
      }

      print("\n📅 Scheduling expiry notifications for ${member.fullName}");
      print("  Current time: $now");
      print("  Expiry date: $expiry");
      print("  Tomorrow alert: $tomorrowAlert");
      print("  Expiry alert: $expiryAlert");

      // Cancel any previous notifications for this member
      final idTomorrow = _generateNotificationId(member.id, 0);
      final idExpiry = _generateNotificationId(member.id, 1);

      await _notificationService.cancelNotification(idTomorrow);
      await _notificationService.cancelNotification(idExpiry);

      // Schedule tomorrow alert
      await _notificationService.scheduleNotification(
        id: idTomorrow,
        title: "⚠️ Expiry Alert",
        body: "${member.fullName}'s membership expires tomorrow",
        date: tomorrowAlert,
      );
      print("  ✓ Scheduled tomorrow alert\n");

      // Schedule expiry date alert
      await _notificationService.scheduleNotification(
        id: idExpiry,
        title: "🚨 Membership Expired",
        body: "${member.fullName}'s membership expires today",
        date: expiryAlert,
      );
      print("  ✓ Scheduled expiry alert\n");
    } catch (e) {
      print("\u2717 Error scheduling expiry notifications: $e");
      rethrow;
    }
  }
}
