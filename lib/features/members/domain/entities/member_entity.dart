import 'package:equatable/equatable.dart';

class MemberEntity extends Equatable {
  final String id;
  final String fullName;
  final String mobileNumber;
  final String aadhaarNumber;
  final String membership;
  final String fee;
  final DateTime joinDate;
  final DateTime expiryDate;
  final String address;
  final bool isActive;
  final String paymentStatus;
  final String paidAmount;
  final String balance;

  const MemberEntity({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
    required this.aadhaarNumber,
    required this.membership,
    required this.fee,
    required this.joinDate,
    required this.expiryDate,
    required this.address,
    required this.isActive,

    // new
    required this.paymentStatus,
    required this.paidAmount,
    required this.balance,
  });

  MemberEntity copyWith({
    String? id,
    String? fullName,
    String? mobileNumber,
    String? aadhaarNumber,
    String? membership,
    String? fee,
    DateTime? joinDate,
    DateTime? expiryDate,
    String? address,
    bool? isActive,
    String? paymentStatus,
    String? paidAmount,
    String? balance,
  }) {
    return MemberEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      aadhaarNumber: aadhaarNumber ?? this.aadhaarNumber,
      membership: membership ?? this.membership,
      fee: fee ?? this.fee,
      joinDate: joinDate ?? this.joinDate,
      expiryDate: expiryDate ?? this.expiryDate,
      address: address ?? this.address,
      isActive: isActive ?? this.isActive,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paidAmount: paidAmount ?? this.paidAmount,
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [
    id,
    fullName,
    mobileNumber,
    aadhaarNumber,
    membership,
    fee,
    joinDate,
    expiryDate,
    address,
    isActive,
    paymentStatus,
    paidAmount,
    balance,
  ];
}
