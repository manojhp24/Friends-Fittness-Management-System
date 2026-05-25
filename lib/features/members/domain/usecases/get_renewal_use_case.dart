
import 'package:gym_management_system/features/members/domain/entities/member_renewal_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

class GetRenewalUseCase {
  final MemberRepository _memberRepository;

  GetRenewalUseCase(this._memberRepository);

  Stream<List<MemberRenewalEntity>> call(String memberID){
    return _memberRepository.getRenewals(memberID);
  }
}