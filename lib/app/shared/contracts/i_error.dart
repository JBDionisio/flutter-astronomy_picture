abstract class IError implements Exception {
  final String message;
  final StackTrace stackTrace;
  final String? reportTag;

  const IError({
    required this.message,
    required this.stackTrace,
    this.reportTag,
  });
}
