import 'package:get_it/get_it.dart';
import 'package:gym_management_system/core/di/auth_dependencies.dart';
import 'package:gym_management_system/core/di/member_dependencies.dart';
import 'package:gym_management_system/core/di/network_dependencies.dart';
import 'package:gym_management_system/core/di/notification_dependencies.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async{
  registerAuthDependencies();
  registerMemberDependencies();
  registerNetworkDependencies();
  registerNotificationDependencies();
}