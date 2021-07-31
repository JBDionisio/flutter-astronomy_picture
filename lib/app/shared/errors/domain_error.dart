import '../contracts/i_error.dart';

class DomainError extends IError {
  final String message;
  final StackTrace stackTrace;
  final String? reportTag;

  DomainError({
    required this.message,
    required this.stackTrace,
    this.reportTag = '-> DomainError <-',
  }) : super(
          message: message,
          stackTrace: stackTrace,
          reportTag: reportTag,
        );
}
