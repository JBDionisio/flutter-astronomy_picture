import 'package:astronomy_picture/app/modules/home/domain/entities/nasa_data_entity.dart';
import 'package:astronomy_picture/app/modules/home/domain/params/get_nasa_data_params.dart';
import 'package:astronomy_picture/app/modules/home/infra/i_datasourcers/i_get_nasa_data_datasource.dart';
import 'package:astronomy_picture/app/modules/home/infra/repositories/get_nasa_data_repository.dart';
import 'package:astronomy_picture/app/shared/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class GetNasaDataDatasourceMock extends Mock implements IGetNasaDataDatasource {
}

class GetNasaDataParamsFake extends Fake implements GetNasaDataParams {}

class PatientEntityMock extends Mock implements List<NasaDataEntity> {}

void main() {
  late GetNasaDataRepository repository;
  late IGetNasaDataDatasource datasource;
  late GetNasaDataParams params;

  setUpAll(() {
    datasource = GetNasaDataDatasourceMock();
    repository = GetNasaDataRepository(datasource);
    params = GetNasaDataParamsFake();
    registerFallbackValue<GetNasaDataParams>(GetNasaDataParamsFake());
  });

  group('GetNasaDataRepository ->', () {
    test('Return a List of NasaDataEntity', () async {
      when(() => datasource(any()))
          .thenAnswer((_) async => PatientEntityMock());

      final result = await repository(params);
      expect(result, isA<Right>());
      expect(result.fold(id, id), isA<List<NasaDataEntity>>());
      verify(() => datasource(any())).called(1);
    });

    test('Return an instance of DataSourceError', () async {
      when(() => datasource(any())).thenThrow(DataSourceError(
        message: 'DataSourceError',
        stackTrace: StackTrace.current,
      ));

      final result = await repository(params);
      expect(result, isA<Left>());
      expect(result.fold(id, id), isA<DataSourceError>());
      verify(() => datasource(any())).called(1);
    });

    test('Return an instance of DataSourceError when Exception', () async {
      when(() => datasource(any())).thenThrow(Exception('DataSourceError'));

      final result = await repository(params);
      expect(result, isA<Left>());
      expect(result.fold(id, id), isA<DataSourceError>());
      verify(() => datasource(any())).called(1);
    });
  });
}
