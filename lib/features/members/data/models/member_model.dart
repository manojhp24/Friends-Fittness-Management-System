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
    required super.expiryDate,
    required super.address,
    required super.isActive,

    // new fields
    required super.paymentStatus,
    required super.paidAmount,
    required super.balance,
  });

  factory MemberModel.formFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};
    return MemberModel(
      id: doc.id,
      fullName: data['fullName'] ?? '',
      mobileNumber: data['mobileNumber'] ?? '',
      aadhaarNumber: data['aadhaarNumber'] ?? '',
      membership: data['membership'] ?? '',
      fee: data['fee'] ?? '',
      joinDate: data['joinDate'] != null
          ? (data['joinDate'] as Timestamp).toDate()
          : DateTime.now(),
      expiryDate: data['expiryDate'] != null
          ? (data['expiryDate'] as Timestamp).toDate()
          : DateTime.now(),
      address: data['address'] ?? '',
      isActive: data['isActive'] ?? true,

      paymentStatus: data['paymentStatus']?.toString() ?? 'Paid',
      paidAmount: data['paidAmount']?.toString() ?? '0',
      balance: data['balance']?.toString() ?? '0',
    );
  }

  factory MemberModel.fromEntity(MemberEntity e) {
    return MemberModel(
      id: e.id,
      fullName: e.fullName,
      mobileNumber: e.mobileNumber,
      aadhaarNumber: e.aadhaarNumber,
      membership: e.membership,
      fee: e.fee,
      joinDate: e.joinDate,
      expiryDate: e.expiryDate,
      address: e.address,
      isActive: e.isActive,

      paymentStatus: e.paymentStatus,
      paidAmount: e.paidAmount,
      balance: e.balance,
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
      'expiryDate': expiryDate,
      'address': address,
      'isActive': isActive,

      'paymentStatus': paymentStatus,
      'paidAmount': paidAmount,
      'balance': balance,
    };
  }

  MemberEntity toEntity() => MemberEntity(
    id: id,
    fullName: fullName,
    mobileNumber: mobileNumber,
    aadhaarNumber: aadhaarNumber,
    membership: membership,
    fee: fee,
    joinDate: joinDate,
    expiryDate: expiryDate,
    address: address,
    isActive: isActive,

    paymentStatus: paymentStatus,
    paidAmount: paidAmount,
    balance: balance,
  );
}
