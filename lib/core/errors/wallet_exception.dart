class WalletException implements Exception {
  final String message;
  final int? statusCode;

  WalletException(this.message, {this.statusCode});

  @override
  String toString() => message;
}