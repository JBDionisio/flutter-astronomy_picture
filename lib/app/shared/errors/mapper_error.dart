import 'errors.dart';

class MapperError extends DataSourceError {
  final String errorCode;
  final StackTrace stackTrace;
  final String errorMessage;
  final String mapperName;

  MapperError({
    required this.errorCode,
    required this.stackTrace,
    required this.errorMessage,
    required this.mapperName,
  }) : super(
          message: 'Erro inesperado [mapper]',
          stackTrace: stackTrace,
          reportTag: '$errorCode $mapperName -> $errorMessage',
        );
}
