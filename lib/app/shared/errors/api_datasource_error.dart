import 'errors.dart';

class ApiDataSourceError extends DataSourceError {
  final dynamic data;
  final dynamic code;
  final StackTrace stackTrace;
  final String? reportTag;

  ApiDataSourceError({
    required this.data,
    this.code,
    required this.stackTrace,
    this.reportTag = '-> ApiDatasourceError <-',
  }) : super(
          message: data,
          stackTrace: stackTrace,
          reportTag: reportTag,
        );

  factory ApiDataSourceError.fromError(
    dynamic data,
    StackTrace stackTrace, {
    dynamic code,
  }) {
    throw (data == null || data.isEmpty || data['message'] == null)
        ? ApiDataSourceError(
            stackTrace: stackTrace,
            data: 'Erro inesperado',
          )
        : ApiDataSourceError(
            stackTrace: stackTrace,
            data: data['message'],
            code: data['code'] ?? '',
          );
  }
}
