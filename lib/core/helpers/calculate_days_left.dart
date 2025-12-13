int calculateDaysLeft(DateTime expiryDate) {
  final now = DateTime.now();
  return expiryDate.difference(DateTime(now.year, now.month, now.day)).inDays;
}
