import 'package:gym_management_system/features/members/data/models/member_model.dart';

abstract class MembersRemoteDataSource {
  Future<String> addMember(Map<String, dynamic> data);
  Future<List<MemberModel>> getMembers();
  Future<void> deleteMember(String memberId);
  Future<void> updateMember(String memberId, Map<String, dynamic> member);
  Future<void> addRenewal(String memberId,Map<String,Object> memberRenewalData);
}
