import '../../../../shared/errors/errors.dart';

class GetNasaDataMapperError extends MapperError {
  final String errorMessage;
  final StackTrace stackTrace;

  GetNasaDataMapperError({
    required this.stackTrace,
    required this.errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
          mapperName: 'GetNasaDataMapperError',
        );
}
