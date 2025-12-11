import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_management_system/features/members/domain/entities/member_entity.dart';

class MemberModel extends MemberEntity {
  const MemberModel({
    required super.id,
    required super.fullName,
    required super.mobileNumber,
    required super.aadhaarNumber,
    required super.membership,
    required super.fee,
    required super.joinDate,
    required super.address,
  });

  factory MemberModel.formFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    return MemberModel(
      id: doc.id,
      fullName: data['fullName'] ?? '',
      mobileNumber: data["mobileNumber"] ?? '',
      aadhaarNumber: data['aadhaarNumber'] ?? '',
      membership: data['membership'] ?? '',
      fee: data['fee'] ?? '',
      joinDate: data['joinDate'] != null
          ? (data['joinDate'] as Timestamp).toDate()
          : DateTime.now(),
      address: data['address'] ?? '',
    );
  }

  /// Convert Entity → Model
  factory MemberModel.fromEntity(MemberEntity entity) {
    return MemberModel(
      id: entity.id,
      fullName: entity.fullName,
      mobileNumber: entity.mobileNumber,
      aadhaarNumber: entity.aadhaarNumber,
      membership: entity.membership,
      fee: entity.fee,
      joinDate: entity.joinDate,
      address: entity.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'aadhaarNumber': aadhaarNumber,
      'membership': membership,
      'fee': fee,
      'joinDate': joinDate,
      'address': address,
    };
  }
}
