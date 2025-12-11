import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';

abstract class MemberRepository {
  Future<DataState<String>> addMember(MemberEntity member);
}
