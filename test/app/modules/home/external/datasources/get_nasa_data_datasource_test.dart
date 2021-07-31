import 'dart:io';

import 'package:astronomy_picture/app/modules/home/domain/entities/nasa_data_entity.dart';
import 'package:astronomy_picture/app/modules/home/domain/params/get_nasa_data_params.dart';
import 'package:astronomy_picture/app/modules/home/external/datasources/get_nasa_data_datasource.dart';
import 'package:astronomy_picture/app/modules/home/external/mappers_error/get_nasa_data_mapper_error.dart';
import 'package:astronomy_picture/app/shared/errors/errors.dart';
import 'package:astronomy_picture/app/shared/services/http_service/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../shared/utils/payloads.dart';

class HttpServiceMock extends Mock implements IHttpService {}

class RequestOptionsMock extends Mock implements RequestOptions {}

void main() {
  late GetNasaDataDatasource datasource;
  late IHttpService httpServiceMock;
  late RequestOptions requestOptions;
  late GetNasaDataParams params;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    httpServiceMock = HttpServiceMock();
    requestOptions = RequestOptionsMock();
    datasource = GetNasaDataDatasource(httpServiceMock);
    params = GetNasaDataParams(
      startDate: DateTime(2021, 7, 29),
      endDate: DateTime(2021, 7, 30),
    );
  });

  group('GetNasaDataDatasource ->', () {
    test('Return a List of NasaDataEntity', () async {
      when(() => httpServiceMock.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer(
        (_) async => Response(
          statusCode: HttpStatus.ok,
          requestOptions: requestOptions,
          data: Payloads.fetchNasaData,
        ),
      );

      final _result = await datasource(params);
      expect(_result, isA<List<NasaDataEntity>>());
    });

    test('Return an instance of ApiDataSourceError - 503', () async {
      when(() => httpServiceMock.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenThrow(
        DioError(
          requestOptions: requestOptions,
          response: Response(
            statusCode: HttpStatus.serviceUnavailable,
            requestOptions: requestOptions,
            data: null,
          ),
        ),
      );

      final _result = datasource(params);
      expect(() => _result, throwsA(isA<ApiDataSourceError>()));
    });

    test('Return an instance of ApiDataSourceError', () async {
      when(() => httpServiceMock.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenThrow(
        DioError(
          requestOptions: requestOptions,
          response: Response(
            statusCode: HttpStatus.internalServerError,
            data: {'message': 'Request Error'},
            requestOptions: requestOptions,
          ),
        ),
      );

      final _result = datasource(params);
      expect(() => _result, throwsA(isA<ApiDataSourceError>()));
    });

    test('Return an instance of GetNasaDataMapperError', () async {
      when(() => httpServiceMock.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer(
        (_) async => Response(
          statusCode: HttpStatus.ok,
          data: Payloads.fetchNasaDataError,
          requestOptions: requestOptions,
        ),
      );

      final _result = datasource(params);
      expect(() => _result, throwsA(isA<GetNasaDataMapperError>()));
    });

    test('Return an error of SocketExceptionError', () async {
      when(() => httpServiceMock.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenThrow(
        DioError(
          requestOptions: requestOptions,
          type: DioErrorType.connectTimeout,
          error: 'Connection Failed',
        ),
      );

      final result = datasource(params);
      expect(() => result, throwsA(isA<SocketExceptionError>()));
    });

    test('Return an instance of DatasourceError', () async {
      final exception = Exception('DataSourceErrorTest');
      when(() => httpServiceMock.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenThrow(exception);

      final _result = datasource(params);
      expect(() => _result, throwsA(isA<DataSourceError>()));
    });
  });
}
