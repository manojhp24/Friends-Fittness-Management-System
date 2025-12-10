import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/authentication/domain/entities/login_credentials.dart';
import 'package:gym_management_system/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> login(LoginCredentials credentials);

  Future<DataState<void>> resetPassword(String email);
}
