import 'errors.dart';

class MapperError extends DataSourceError {
  final StackTrace stackTrace;
  final String errorMessage;
  final String mapperName;

  MapperError({
    required this.stackTrace,
    required this.errorMessage,
    required this.mapperName,
  }) : super(
          message: 'Erro inesperado [mapper]',
          stackTrace: stackTrace,
          reportTag: '$mapperName -> $errorMessage',
        );
}
