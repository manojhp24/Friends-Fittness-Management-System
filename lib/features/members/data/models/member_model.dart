import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/member_entity.dart';

class MemberModel {
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
  final DateTime? lastRenewalDate;

  const MemberModel({
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
    required this.paymentStatus,
    required this.paidAmount,
    required this.balance,
    this.lastRenewalDate,
  });

  // 🔽 Firestore → Model
  factory MemberModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc,
      ) {
    final data = doc.data() ?? {};

    return MemberModel(
      id: doc.id,
      fullName: data['fullName'] ?? '',
      mobileNumber: data['mobileNumber'] ?? '',
      aadhaarNumber: data['aadhaarNumber'] ?? '',
      membership: data['membership'] ?? '',
      fee: data['fee'] ?? '',
      joinDate: _toDate(data['joinDate']),
      expiryDate: _toDate(data['expiryDate']),
      address: data['address'] ?? '',
      isActive: data['isActive'] ?? true,
      paymentStatus: data['paymentStatus']?.toString() ?? 'Paid',
      paidAmount: data['paidAmount']?.toString() ?? '0',
      balance: data['balance']?.toString() ?? '0',
      lastRenewalDate: _toNullableDate(data['lastRenewalDate']),
    );
  }

  // 🔽 Entity → Model
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
      lastRenewalDate: e.lastRenewalDate,
    );
  }

  // 🔽 Model → Firestore
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'aadhaarNumber': aadhaarNumber,
      'membership': membership,
      'fee': fee,
      'joinDate': Timestamp.fromDate(joinDate),
      'expiryDate': Timestamp.fromDate(expiryDate),
      'address': address,
      'isActive': isActive,
      'paymentStatus': paymentStatus,
      'paidAmount': paidAmount,
      'balance': balance,
      'lastRenewalDate': lastRenewalDate != null
          ? Timestamp.fromDate(lastRenewalDate!)
          : null,
    };
  }

  // 🔽 Model → Entity
  MemberEntity toEntity() {
    return MemberEntity(
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
      lastRenewalDate: lastRenewalDate,
    );
  }

  // 🔧 Helpers (safe conversion)

  static DateTime _toDate(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is DateTime) return value;
    return DateTime.now();
  }

  static DateTime? _toNullableDate(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is DateTime) return value;
    return null;
  }
}