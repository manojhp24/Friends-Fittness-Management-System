import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';

List<MemberEntity> filterMember(List<MemberEntity> members, String search) {
  if (search.isEmpty) return members;

  return members.where((m) {
    return m.fullName.toLowerCase().contains(search.toLowerCase()) ||
        m.mobileNumber.contains(search);
  }).toList();
}
