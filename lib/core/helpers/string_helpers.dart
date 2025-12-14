class StringHelpers {
  StringHelpers._();

  static String capitalizeWords(String value) {
    return value
        .trim()
        .split(RegExp(r'\s+'))
        .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1))
        .join(' ');
  }
}
