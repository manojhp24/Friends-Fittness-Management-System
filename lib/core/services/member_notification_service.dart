import 'package:gym_management_system/core/services/notification_service.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';

import '../di/service_locator.dart';

class MemberNotificationService {
  final NotificationService _notificationService = sl<NotificationService>();

  Future<void> scheduleExpiry(MemberEntity member) async {

    final now = DateTime.now();

    final expiry = member.expiryDate;

    final expiryWithTime = DateTime(
      expiry.year,
      expiry.month,
      expiry.day,
      9
    );

    final tomorrowAlert = expiryWithTime.subtract(const Duration(days: 1));


    print("Now: ${DateTime.now()}");
    print("Expiry: $expiry");

    await _notificationService.cancelNotification(member.id.hashCode);
    await _notificationService.cancelNotification(member.id.hashCode + 1);

    if (tomorrowAlert.isAfter(now)) {
      await _notificationService.scheduleNotification(
        id: member.id.hashCode,
        title: "Expiry Alert",
        body: "${member.fullName} membership expires tomorrow",
        date: tomorrowAlert,
      );
    }


    if (expiryWithTime.isAfter(now)) {
      await _notificationService.scheduleNotification(
        id: member.id.hashCode + 1,
        title: "Expired",
        body: "${member.fullName} membership expires today",
        date: expiryWithTime,
      );
    }
  }
}
