import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_management_system/core/services/member_notification_service.dart';
import 'package:gym_management_system/core/utils/data_state.dart';
import 'package:gym_management_system/features/members/data/data_source/members_remote_data_source.dart';
import 'package:gym_management_system/features/members/data/models/member_model.dart';
import 'package:gym_management_system/features/members/data/models/renewal_model.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';
import 'package:gym_management_system/features/members/domain/entities/member_renewal_entity.dart';
import 'package:gym_management_system/features/members/domain/repository/member_repository.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/exception/firestore_exception_mapper.dart';

class MemberRepositoryImpl extends MemberRepository {
  final MembersRemoteDataSource _membersRemoteDataSource;

  MemberRepositoryImpl(this._membersRemoteDataSource);

  @override
  Future<DataState<String>> addMember(MemberEntity member) async {
    try {
      final model = MemberModel.fromEntity(member);
      final id = await _membersRemoteDataSource.addMember(model.toMap());
      member = member.copyWith(id: id);
      await sl<MemberNotificationService>().scheduleExpiry(member);
      return DataSuccess(id);
    } on FirebaseException catch (e) {
      return DataFailed(FirestoreExceptionsMapper.map(e.code));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Stream<DataState<List<MemberEntity>>> getMembers() {
    return _membersRemoteDataSource.getMembers().map((models){
      final entities = models.map((m) => m.toEntity()).toList();
      return DataSuccess(entities);
    });
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

  @override
  Future<DataState<void>> updateMember(MemberEntity member) async {
    try {
      final memberModel = MemberModel.fromEntity(member);
      await _membersRemoteDataSource.updateMember(
          member.id, memberModel.toMap());
      return DataSuccess(null);
    } on FirebaseException catch (e) {
      return DataFailed(FirestoreExceptionsMapper.map(e.code));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<void>> renewMember(MemberEntity updateMember,
      MemberRenewalEntity memberRenewal) async {
    try {

      updateMember = updateMember.copyWith(
        lastRenewalDate: DateTime.now(),
      );

      final memberModel = MemberModel.fromEntity(updateMember);

      final memberRenewalModel = RenewalModel.fromEntity(memberRenewal);

      await _membersRemoteDataSource.addRenewal(
          updateMember.id, memberRenewalModel.toMap());

      await _membersRemoteDataSource.updateMember(
          updateMember.id, memberModel.toMap());

      return DataSuccess(null);
    } on FirebaseException catch (e) {
      return DataFailed(FirestoreExceptionsMapper.map(e.code));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Stream<List<MemberRenewalEntity>> getRenewals(String memberID) {
    return _membersRemoteDataSource.getRenewals(memberID).map((list){
      return list.map((data) => RenewalModel.fromMap(data).toEntity()).toList();
    });
  }
}
