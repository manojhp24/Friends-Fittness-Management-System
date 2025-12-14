import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_management_system/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.uid, required super.email});

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};

    return UserModel(uid: data['id'] ?? doc.id, email: data['email'] ?? "");
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email};
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(uid: user.uid, email: user.email);
  }
}
