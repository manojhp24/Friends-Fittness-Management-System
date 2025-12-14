
import 'package:gym_management_system/core/use_case/no_params.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

class GetMembersUseCase extends UseCaseNoParams<DataState<List<MemberEntity>>> {
  final MemberRepository repo;

  GetMembersUseCase(this.repo);

  @override
  Future<DataState<List<MemberEntity>>> call() {
    return repo.getMembers();
  }
}

