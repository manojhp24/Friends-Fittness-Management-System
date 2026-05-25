import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_management_system/features/members/domain/entities/member_renewal_entity.dart';

class RenewalModel extends MemberRenewalEntity {
  RenewalModel({
    required super.plan,
    required super.fee,
    required super.paymentStatus,
    required super.paidAmount,
    required super.balance,
    required super.startDate,
    required super.expiryDate,
    required super.createdAt,
  });

  factory RenewalModel.fromEntity(MemberRenewalEntity e) {
    return RenewalModel(
      plan: e.plan,
      fee: e.fee,
      paymentStatus: e.paymentStatus,
      paidAmount: e.paidAmount,
      balance: e.balance,
      startDate: e.startDate,
      expiryDate: e.expiryDate,
      createdAt: e.createdAt,
    );
  }

  Map<String, Object> toMap() {
    return {
      "plan": plan,
      "fee": fee,
      "paidAmount": paidAmount,
      "balance": balance,
      "paymentStatus": paymentStatus,
      "startDate": startDate,
      "expiryDate": expiryDate,
      "createdAt": createdAt,
    };
  }
  factory RenewalModel.fromMap(Map<String, dynamic> map) {
    return RenewalModel(
      plan: map['plan'] ?? '',
      fee: map['fee'] ?? 0,
      paymentStatus: map['paymentStatus'] ?? '',
      paidAmount: map['paidAmount'] ?? 0,
      balance: map['balance'] ?? 0,

      // 👇 FIX HERE
      startDate: (map['startDate'] as Timestamp).toDate(),
      expiryDate: (map['expiryDate'] as Timestamp).toDate(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  MemberRenewalEntity toEntity() {
    return MemberRenewalEntity(
      plan: plan,
      fee: fee,
      paymentStatus: paymentStatus,
      paidAmount: paidAmount,
      balance: balance,
      startDate: startDate,
      expiryDate: expiryDate,
      createdAt: createdAt,
    );
  }
}
