class ApiException implements Exception {
  final String? message;
  final int? code;
  final Object? error;

  ApiException(this.message, this.code, {this.error});

  @override
  String toString() {
    return 'ApiException{message: $message, code: $code, error: $error}';
  }
}
