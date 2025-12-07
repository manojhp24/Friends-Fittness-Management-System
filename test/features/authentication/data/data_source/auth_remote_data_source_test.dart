import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_management_system/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late AuthRemoteDataSource dataSource;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    dataSource = AuthRemoteDataSource(mockFirebaseAuth);
  });

  test("✔ returns UserCredential when login succeeds", () async {
    final mockUserCredential = MockUserCredential();
    final mockUser = MockFirebaseUser();

    when(() => mockUserCredential.user).thenReturn(mockUser);

    when(
      () => mockFirebaseAuth.signInWithEmailAndPassword(
        email: "test@mail.com",
        password: "123456",
      ),
    ).thenAnswer((_) async => mockUserCredential);

    // act
    final result = await dataSource.loginWithEmailPassword(
      "test@mail.com",
      "123456",
    );

    // assert
    expect(result, isA<UserCredential>());
    verify(
      () => mockFirebaseAuth.signInWithEmailAndPassword(
        email: "test@mail.com",
        password: "123456",
      ),
    ).called(1);
  });

  test("❌ throws exception when firebase login fails", () async {
    // arrange failure
    when(
      () => mockFirebaseAuth.signInWithEmailAndPassword(
        email: "wrong@mail.com",
        password: "wrong",
      ),
    ).thenThrow(FirebaseAuthException(code: 'wrong-password'));

    // assert
    expect(
      () => dataSource.loginWithEmailPassword("wrong@mail.com", "wrong"),
      throwsA(isA<FirebaseAuthException>()),
    );

    verify(
      () => mockFirebaseAuth.signInWithEmailAndPassword(
        email: "wrong@mail.com",
        password: "wrong",
      ),
    ).called(1);
  });
}
