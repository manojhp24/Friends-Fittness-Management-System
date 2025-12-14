import 'package:gym_management_system/core/use_case/base_use_case.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

class DeleteMemberUseCase extends UseCase<DataState<void>, String> {
  final MemberRepository _memberRepository;

  DeleteMemberUseCase(this._memberRepository);

  @override
  Future<DataState<void>> call(String memberId) =>
      _memberRepository.deleteMember(memberId);
}
