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
}
