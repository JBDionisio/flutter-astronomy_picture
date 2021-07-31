import 'errors.dart';

class SocketExceptionError extends DataSourceError {
  final String message;
  final StackTrace stackTrace;
  final String? reportTag;

  SocketExceptionError({
    required this.message,
    required this.stackTrace,
    this.reportTag = '-> SocketExceptionError <-',
  }) : super(
          message: message,
          stackTrace: stackTrace,
          reportTag: reportTag,
        );
}
