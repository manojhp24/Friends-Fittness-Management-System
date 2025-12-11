import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_management_system/features/members/data/data_source/members_remote_data_source.dart';

class FirebaseMembersRemoteDataSourceImpl implements MembersRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseMembersRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<String> addMember(Map<String, dynamic> data) async {
    final ref = await _firebaseFirestore.collection("members").add(data);
    return ref.id;
  }
}
