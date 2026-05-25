import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/core/services/member_notification_service.dart';
import 'package:gym_management_system/core/services/notification_service.dart';

void registerNotificationDependencies() {
  sl.registerLazySingleton<NotificationService>(() => NotificationService());
  sl.registerLazySingleton<MemberNotificationService>(
    () => MemberNotificationService(),
  );
}
