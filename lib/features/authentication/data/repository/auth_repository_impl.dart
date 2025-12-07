import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:gym_management_system/features/authentication/data/models/user_model.dart';
import 'package:gym_management_system/features/authentication/domain/entities/login_credentials.dart';
import 'package:gym_management_system/features/authentication/domain/entities/user_entity.dart';
import 'package:gym_management_system/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<DataState<UserEntity>> login(LoginCredentials credentials) async {
    try {
      final result = await authRemoteDataSource.loginWithEmailPassword(
        credentials.email,
        credentials.password,
      );

      final user = UserModel(uid: result.user!.uid, email: result.user!.email!);

      return DataSuccess(user);
    } catch (e) {
      return DataFailed("Invalid email or password");
    }
  }
}
