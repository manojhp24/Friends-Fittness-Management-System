import 'package:gym_management_system/core/use_case/base_use_case.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/authentication/domain/entities/login_credentials.dart';
import 'package:gym_management_system/features/authentication/domain/entities/user_entity.dart';
import 'package:gym_management_system/features/authentication/domain/repository/auth_repository.dart';

class LoginUseCase extends UseCase<DataState<UserEntity>, LoginCredentials> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<DataState<UserEntity>> call(LoginCredentials credentials) {
    return _repository.login(credentials);
  }
}
