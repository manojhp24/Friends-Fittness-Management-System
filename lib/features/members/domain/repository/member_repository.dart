import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/entities/member_renewal_entity.dart';

abstract class MemberRepository {
  Future<DataState<String>> addMember(MemberEntity member);
  Future<DataState<List<MemberEntity>>> getMembers();
  Future<DataState<void>> deleteMember(String memberId);

  Future<DataState<void>> updateMember(MemberEntity member);

  Future<DataState<void>> renewMember(MemberEntity updateMember,
      MemberRenewalEntity memberRenewal);
}
