class ApiError implements Exception {
  ApiError({required this.message});
  final String message;

  @override
  String toString() {
    return 'ApiError(message: $message)';
  }
}
