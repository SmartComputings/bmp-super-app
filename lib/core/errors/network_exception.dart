class NetworkException implements Exception {
  final String message;
  final NetworkErrorType type;

  NetworkException(this.message, [this.type = NetworkErrorType.unknown]);

  @override
  String toString() => message;

  bool get isTimeout => type == NetworkErrorType.timeout;
  bool get isNoConnection => type == NetworkErrorType.noConnection;
  bool get isSlowConnection => type == NetworkErrorType.slowConnection;
}

enum NetworkErrorType {
  timeout,
  noConnection,
  slowConnection,
  unknown,
}