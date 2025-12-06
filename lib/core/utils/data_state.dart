/// Base class representing the state of a data request.
/// It can either contain actual data (success state)
/// or an error message (failed state).
abstract class DataState<T> {
  /// Holds the successful result (if any).
  final T? data;

  /// Holds the error message (if any).
  final String? message;

  /// Constructor used by both success and failure states.
  const DataState({this.data, this.message});
}

/// Represents a successful data response.
/// Contains valid data and no error message.
class DataSuccess<T> extends DataState<T> {
  /// Requires the actual data to be passed.
  const DataSuccess(T data) : super(data: data);
}

/// Represents a failed data response.
/// Contains an error message and no data.
class DataFailed<T> extends DataState<T> {
  /// Requires an error message describing the failure.
  const DataFailed(String message) : super(message: message);
}
