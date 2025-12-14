import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/data/data_source/members_remote_data_source.dart';
import 'package:gym_management_system/features/members/data/models/member_model.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

import '../../../../core/exception/firestore_exception_mapper.dart';

class MemberRepositoryImpl extends MemberRepository {
  final MembersRemoteDataSource _membersRemoteDataSource;

  MemberRepositoryImpl(this._membersRemoteDataSource);

  @override
  Future<DataState<String>> addMember(MemberEntity member) async {
    try {
      final model = MemberModel.fromEntity(member);
      final id = await _membersRemoteDataSource.addMember(model.toMap());
      return DataSuccess(id);
    } on FirebaseException catch (e) {
      return DataFailed(FirestoreExceptionsMapper.map(e.code));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<MemberEntity>>> getMembers() async {
    try {
      final models = await _membersRemoteDataSource.getMembers();
      final entities = models.map((model) => model.toEntity()).toList();
      return DataSuccess(entities);
    } on FirebaseException catch (e) {
      return DataFailed(FirestoreExceptionsMapper.map(e.code));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<void>> deleteMember(String memberId) async {
    try {
      await _membersRemoteDataSource.deleteMember(memberId);
      return DataSuccess(null);
    } on FirebaseException catch (e) {
      return DataFailed(FirestoreExceptionsMapper.map(e.code));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
