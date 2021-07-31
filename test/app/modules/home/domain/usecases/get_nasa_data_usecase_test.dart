import 'package:astronomy_picture/app/modules/home/domain/entities/nasa_data_entity.dart';
import 'package:astronomy_picture/app/modules/home/domain/i_repositories/i_get_nasa_data_repository.dart';
import 'package:astronomy_picture/app/modules/home/domain/params/get_nasa_data_params.dart';
import 'package:astronomy_picture/app/modules/home/domain/usecases/get_nasa_data_usecase.dart';
import 'package:astronomy_picture/app/shared/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class GetNasaDataRepositoryMock extends Mock implements IGetNasaDataRepository {
}

class GetNasaDataParamsFake extends Fake implements GetNasaDataParams {}

class PatientEntityMock extends Mock implements List<NasaDataEntity> {}

void main() {
  late GetNasaDataUsecase usecase;
  late IGetNasaDataRepository repository;
  late GetNasaDataParams params;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue<GetNasaDataParams>(GetNasaDataParamsFake());

    repository = GetNasaDataRepositoryMock();
    usecase = GetNasaDataUsecase(repository);
    params = GetNasaDataParams(
      startDate: DateTime(2021, 7, 29),
      endDate: DateTime(2021, 7, 30),
    );
  });

  group('GetNasaDataUsecase ->', () {
    test('Return a List of NasaDataEntity', () async {
      when(() => repository(any())).thenAnswer(
        (_) async => Right(PatientEntityMock()),
      );
      final result = await usecase(params);

      expect(result, isA<Right>());
      expect(result.fold(id, id), isA<List<NasaDataEntity>>());
    });

    test('Return an instance of DomainError - endDate before startDate',
        () async {
      params = GetNasaDataParams(
        startDate: DateTime(2021, 7, 30),
        endDate: DateTime(2021, 7, 29),
      );
      final result = await usecase(params);

      expect(result, isA<Left>());
      expect(result.fold(id, id), isA<DomainError>());
    });
  });
}
