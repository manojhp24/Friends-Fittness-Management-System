int getMembershipDays(String membership) {
  switch (membership) {
    case "1 month":
      return 30;
    case '3 months':
      return 90;
    case '6 months':
      return 180;
    case '1 year':
      return 365;
    default:
      return 30;
  }
}
