import 'package:dartz/dartz.dart';

import '../../../../shared/contracts/i_error.dart';
import '../../../../shared/errors/errors.dart';
import '../entities/nasa_data_entity.dart';
import '../i_repositories/i_get_nasa_data_repository.dart';
import '../params/get_nasa_data_params.dart';

abstract class IGetNasaDataUsecase {
  Future<Either<IError, List<NasaDataEntity>>> call(GetNasaDataParams params);
}

class GetNasaDataUsecase implements IGetNasaDataUsecase {
  final IGetNasaDataRepository repository;

  GetNasaDataUsecase(this.repository);

  @override
  Future<Either<IError, List<NasaDataEntity>>> call(
    GetNasaDataParams params,
  ) async {
    if (params.endDate.isBefore(params.startDate)) {
      return Left(DomainError(
        message: 'Data final não pode ser antes da data inicial.',
        stackTrace: StackTrace.current,
      ));
    }

    final result = await repository.call(params);
    return result;
  }
}
