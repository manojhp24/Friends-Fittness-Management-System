import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_management_system/features/members/data/data_source/members_remote_data_source.dart';
import 'package:gym_management_system/features/members/data/models/member_model.dart';

class FirebaseMembersRemoteDataSourceImpl implements MembersRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseMembersRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<String> addMember(Map<String, dynamic> data) async {
    final ref = await _firebaseFirestore.collection("members").add(data);
    return ref.id;
  }

  @override
  Stream<List<MemberModel>> getMembers()  {
    return _firebaseFirestore.collection("members").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => MemberModel.fromFirestore(doc)).toList();
    });
  }

  @override
  Future<void> deleteMember(String memberId) async {
    final batch = _firebaseFirestore.batch();

    final renewalRef = _firebaseFirestore
        .collection('members')
        .doc(memberId)
        .collection('renewals');

    final renewalsSnapshot = await renewalRef.get();

    for (final doc in renewalsSnapshot.docs) {
      batch.delete(doc.reference);
    }

    batch.delete(_firebaseFirestore.collection('members').doc(memberId));

    await batch.commit();
  }

  @override
  Future<void> updateMember(
    String memberId,
    Map<String, dynamic> member,
  ) async {
    await _firebaseFirestore.collection("members").doc(memberId).update(member);
  }

  @override
  Future<void> addRenewal(
    String memberId,
    Map<String, Object> memberRenewalData,
  ) async {
    await _firebaseFirestore
        .collection('members')
        .doc(memberId)
        .collection('renewals')
        .add(memberRenewalData);
  }

  @override
  Stream<List<Map<String, dynamic>>> getRenewals(String memberId) {
    return _firebaseFirestore
        .collection('members')
        .doc(memberId)
        .collection('renewals')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}
