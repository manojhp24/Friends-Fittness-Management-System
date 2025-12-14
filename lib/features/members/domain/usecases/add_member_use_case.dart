import 'package:gym_management_system/core/use_case/base_use_case.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

class AddMemberUseCase extends UseCase<DataState<String>, MemberEntity> {
  final MemberRepository _memberRepository;

  AddMemberUseCase(this._memberRepository);

  @override
  Future<DataState<String>> call(MemberEntity member) {
    return _memberRepository.addMember(member);
  }
}
