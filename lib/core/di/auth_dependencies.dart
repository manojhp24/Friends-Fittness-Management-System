import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_management_system/core/di/service_locator.dart';
import 'package:gym_management_system/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:gym_management_system/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:gym_management_system/features/authentication/domain/repository/auth_repository.dart';

import '../../features/authentication/domain/usecases/login_usecase.dart';
import '../../features/authentication/presentation/provider/auth_notifier.dart';

void registerAuthDependencies() {

  // Firebase auth instance
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data source
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use case
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  // Notifier (gets use case automatically via DI)
  sl.registerFactory<AuthNotifier>(() => AuthNotifier(sl()));
}