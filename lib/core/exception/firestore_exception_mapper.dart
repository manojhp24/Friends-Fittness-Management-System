class FirestoreExceptionsMapper {
  static String map(String code) {
    switch (code) {

      case 'permission-denied':
        return "You don't have permission to perform this action.";

      case 'unavailable':
        return "Network unavailable. Please check your internet connection.";

      case 'not-found':
        return "Requested data does not exist.";

      case 'aborted':
        return "The operation was aborted. Try again.";

      case 'already-exists':
        return "This record already exists.";

      case 'invalid-argument':
        return "Invalid data provided.";

      case 'deadline-exceeded':
        return "The server took too long to respond. Try again.";

      case 'resource-exhausted':
        return "Server limit reached. Try again later.";

      case 'failed-precondition':
        return "The operation is not allowed in the current state.";

      case 'cancelled':
        return "The operation was cancelled.";

      case 'internal':
        return "Internal server error. Please try again later.";

      case 'unauthenticated':
        return "You need to log in again.";

      default:
        return "Something went wrong. (Code: $code)";
    }
  }
}
