

import 'package:gym_management_system/core/use_case/stream_base_use_case.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

class GetMembersUseCase extends StreamUseCaseNoParam<DataState<List<MemberEntity>>> {
  final MemberRepository repo;

  GetMembersUseCase(this.repo);

  @override
  Stream<DataState<List<MemberEntity>>> call() {
    return repo.getMembers();
  }
}

