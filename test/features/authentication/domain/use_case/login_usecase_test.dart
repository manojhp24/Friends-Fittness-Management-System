import 'package:flutter_test/flutter_test.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/authentication/domain/entities/login_credentials.dart';
import 'package:gym_management_system/features/authentication/domain/entities/user_entity.dart';
import 'package:gym_management_system/features/authentication/domain/repository/auth_repository.dart';
import 'package:gym_management_system/features/authentication/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MocAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase loginUseCase;
  late MocAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MocAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  group("Login Use Case Test- ", () {
    test("should return DataSuccess<UserEntity> when login succeeds", () async {
      // Arrange
      const credentials = LoginCredentials(
        email: "test@gmail.com",
        password: "1234",
      );

      const mockUser = UserEntity(uid: "1", email: "test@gmail.com");

      when(
        () => mockAuthRepository.login(credentials),
      ).thenAnswer((_) async => const DataSuccess(mockUser));

      // Act
      final result = await loginUseCase(credentials);

      // Assert
      expect(result, isA<DataSuccess<UserEntity>>());
      expect((result as DataSuccess<UserEntity>).data, mockUser);

      verify(() => mockAuthRepository.login(credentials)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test("should return DataFailed<UserEntity> when login fails", () async {
      const credentials = LoginCredentials(
        email: "wrong@gmail.com",
        password: "wrong",
      );

      when(
        () => mockAuthRepository.login(credentials),
      ).thenAnswer((_) async => DataFailed("Incorrect email or password"));

      final result = await loginUseCase(credentials);

      expect(result, isA<DataFailed<UserEntity>>());
      expect(result.message, equals("Incorrect email or password"));

      verify(() => mockAuthRepository.login(credentials)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
