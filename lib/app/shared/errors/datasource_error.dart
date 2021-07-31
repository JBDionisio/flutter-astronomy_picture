import '../contracts/i_error.dart';

class DataSourceError extends IError {
  final String message;
  final StackTrace stackTrace;
  final String? reportTag;
  final String? indexedCode;

  DataSourceError({
    required this.message,
    required this.stackTrace,
    this.indexedCode,
    this.reportTag = '-> DatasourceError <-',
  }) : super(
          message: message,
          stackTrace: stackTrace,
          reportTag: reportTag,
        );
}
