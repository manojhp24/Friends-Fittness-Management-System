({String top, String bottom}) getExpiryText(int days) {
  if (days < 0) {
    return (
    top: "Expired",
    bottom: "${days.abs()} days ago",
    );
  }

  if (days == 0) {
    return (
    top: "Today",
    bottom: "Expires",
    );
  }

  return (
  top: days.toString(),
  bottom: "days left",
  );
}
