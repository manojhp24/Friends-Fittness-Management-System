import 'package:gym_management_system/core/use_case/base_use_case.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/authentication/domain/repository/auth_repository.dart';

class ForgotPasswordUsecase extends UseCase<DataState<void>, String> {

  final AuthRepository _repository;

  ForgotPasswordUsecase(this._repository);

  @override
  Future<DataState<void>> call(String email) {
    return _repository.resetPassword(email);
  }

}