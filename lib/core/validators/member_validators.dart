class MemberValidators {
  MemberValidators._();
  static String? requiredField(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return "Enter a valid phone number";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? aadhaar(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Aadhaar number is required";
    }
    if (!RegExp(r'^\d{12}$').hasMatch(value)) {
      return "Enter a valid 12-digit Aadhaar number";
    }
    return null;
  }

  static String? fee(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Fee is required";
    }
    if (double.tryParse(value) == null) {
      return "Fee must be a number";
    }
    return null;
  }
}
