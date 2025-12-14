class AuthValidators {
  AuthValidators._();

  static String? validateEmail(String email) {
    if (email.trim().isEmpty) return "Email is required";
    if (!email.contains("@") || !email.contains(".")) {
      return "Enter valid email";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.trim().isEmpty) return "Password is required";
    if (password.length < 6) return "Password must be at least 6 characters";
    return null;
  }
}
