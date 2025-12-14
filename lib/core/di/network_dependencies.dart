import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/core/network/network_info.dart';
import 'package:gym_management_system/core/network/network_info_impl.dart';

void registerNetworkDependencies() {
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
