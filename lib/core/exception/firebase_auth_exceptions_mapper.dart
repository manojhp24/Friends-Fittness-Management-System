class FirebaseAuthExceptionsMapper {
  static String map(String code) {
    const errors = {
      'invalid-email'        : "Invalid email format.",
      'wrong-password'       : "Incorrect password.",
      'invalid-credential'   : "Incorrect email or password.",
      'user-not-found'       : "No account found with this email.",
      'email-already-in-use' : "This email is already registered.",
      'user-disabled'        : "This account has been disabled. Pay remaining amount to activate.",
      'too-many-requests'    : "Too many attempts. Please try again later.",
      'network-request-failed': "Network error. Check your internet connection.",
    };

    return errors[code] ?? "Something went wrong. Please try again.";
  }
}
