import 'package:flutter_test/flutter_test.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';
import 'package:gym_management_system/features/members/domain/usecases/add_member_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockMemberRepository extends Mock implements MemberRepository {}

void main() {
  late MockMemberRepository mockMemberRepository;
  late AddMemberUseCase addMemberUseCase;

  final member = MemberEntity(
    id: "",
    fullName: "Manoj",
    mobileNumber: "6361337631",
    aadhaarNumber: "12345678912",
    membership: "Basic",
    fee: "1000",
    joinDate: DateTime.now(),
    address: "KRS",
    isActive: true,
    expiryDate: DateTime.now(),
    paymentStatus: '',
    paidAmount: '',
    balance: '',
  );

  setUp(() {
    mockMemberRepository = MockMemberRepository();
    addMemberUseCase = AddMemberUseCase(mockMemberRepository);
  });

  group("Add Member UseCase Test- ", () {
    test(
      "should return DataSuccess<String> when member added successfully",
      () async {
        when(
          () => mockMemberRepository.addMember(member),
        ).thenAnswer((_) async => DataSuccess("generatedID123456"));

        final result = await addMemberUseCase(member);

        expect(result, isA<DataSuccess<String>>());
        expect((result as DataSuccess<String>).data, "generatedID123456");

        verify(() => mockMemberRepository.addMember(member)).called(1);
        verifyNoMoreInteractions(mockMemberRepository);
      },
    );

    test(
      "should return DataFailed<String> when repository throws exception or Error",
      () async {
        when(
          () => mockMemberRepository.addMember(member),
        ).thenAnswer((_) async => DataFailed("Firestore Error"));

        final result = await addMemberUseCase(member);

        expect(result, isA<DataFailed<String>>());
        expect(result.message, "Firestore Error");
      },
    );
  });
}
