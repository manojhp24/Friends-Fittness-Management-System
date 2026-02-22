class MemberRenewalEntity {
  final String plan;
  final String fee;
  final String paymentStatus;
  final String paidAmount;
  final String balance;
  final DateTime startDate;
  final DateTime expiryDate;
  final DateTime createdAt;

  const MemberRenewalEntity({
    required this.plan,
    required this.fee,
    required this.paymentStatus,
    required this.paidAmount,
    required this.balance,
    required this.startDate,
    required this.expiryDate,
    required this.createdAt,
  });
}
