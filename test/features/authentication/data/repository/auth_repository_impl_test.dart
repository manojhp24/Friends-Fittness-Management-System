import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:gym_management_system/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:gym_management_system/features/authentication/domain/entities/login_credentials.dart';
import 'package:mocktail/mocktail.dart';

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepositoryImpl repository;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(mockAuthRemoteDataSource);
  });

  group("AuthRepositoryImpl Login Tests", () {
    test(
      "✔ returns DataSuccess<UserEntity> when remote login succeeds",
      () async {
        // Arrange mocks
        final mockUserCred = MockUserCredential();
        final mockUser = MockFirebaseUser();

        when(() => mockUser.uid).thenReturn("123");
        when(() => mockUser.email).thenReturn("test@mail.com");
        when(() => mockUserCred.user).thenReturn(mockUser);

        const credentials = LoginCredentials(
          email: "test@mail.com",
          password: "123456",
        );

        when(
          () => mockAuthRemoteDataSource.loginWithEmailPassword(
            credentials.email,
            credentials.password,
          ),
        ).thenAnswer((_) async => mockUserCred);

        // Act
        final result = await repository.login(credentials);

        // Assert
        expect(result, isA<DataSuccess>());
        expect(result.data!.email, equals("test@mail.com"));
        expect(result.data!.uid, equals("123"));

        verify(
          () => mockAuthRemoteDataSource.loginWithEmailPassword(
            credentials.email,
            credentials.password,
          ),
        ).called(1);
      },
    );

    test("❌ returns DataFailed when remote throws exception", () async {
      const credentials = LoginCredentials(
        email: "wrong@mail.com",
        password: "wrong",
      );

      when(
        () => mockAuthRemoteDataSource.loginWithEmailPassword(
          credentials.email,
          credentials.password,
        ),
      ).thenThrow(Exception("Invalid credentials"));

      final result = await repository.login(credentials);

      expect(result, isA<DataFailed>());
      expect(result.message, contains("Invalid"));

      verify(
        () => mockAuthRemoteDataSource.loginWithEmailPassword(
          credentials.email,
          credentials.password,
        ),
      ).called(1);
    });
  });
}
