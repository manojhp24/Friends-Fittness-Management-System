import 'package:gym_management_system/core/use_case/base_use_case.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

class UpdateMemberUseCase extends UseCase<DataState<void>, MemberEntity > {
  final MemberRepository _memberRepository;

  UpdateMemberUseCase(this._memberRepository);

  @override
  Future<DataState<void>> call(MemberEntity member) =>
      _memberRepository.updateMember(member);
}
