class FirebaseAuthExceptionsMapper {
  static String map(String code) {
    switch (code) {

      case 'invalid-email':
        return "Enter a valid email address.";

      case 'missing-email':
        return "Please enter your email.";

      case 'user-not-found':
        return "No account found with this email.";

      case 'email-already-in-use':
        return "This email is already registered.";

      case 'invalid-credential':
        return "Authentication failed. Try again.";

      case 'user-disabled':
        return "This account has been disabled. Please contact support.";

      case 'operation-not-allowed':
        return "This action is not allowed right now.";

      case 'too-many-requests':
        return "Too many attempts. Try again later.";

      case 'network-request-failed':
        return "Network error. Check your internet connection.";

      case 'internal-error':
        return "Something went wrong. Try again later.";

      default:
        return "Unexpected error occurred. Please try again.";
    }
  }
}
