import 'package:equatable/equatable.dart';

class MemberEntity extends Equatable {
  final String id;
  final String fullName;
  final String mobileNumber;
  final String email;
  final String aadhaarNumber;
  final String membership;
  final String fee;
  final DateTime joinDate;
  final DateTime expiryDate;
  final String address;
  final bool isActive;

  const MemberEntity({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
    required this.aadhaarNumber,
    required this.membership,
    required this.fee,
    required this.joinDate,
    required this.address,
    required this.isActive, required this.email, required this.expiryDate,
  });

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
    email
  ];
}
