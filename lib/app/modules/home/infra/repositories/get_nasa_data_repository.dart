import 'package:dartz/dartz.dart';

import '../../../../shared/contracts/i_error.dart';
import '../../../../shared/errors/errors.dart';
import '../../domain/entities/nasa_data_entity.dart';
import '../../domain/i_repositories/i_get_nasa_data_repository.dart';
import '../../domain/params/get_nasa_data_params.dart';
import '../i_datasourcers/i_get_nasa_data_datasource.dart';

class GetNasaDataRepository extends IGetNasaDataRepository {
  final IGetNasaDataDatasource datasource;

  GetNasaDataRepository(this.datasource);

  @override
  Future<Either<IError, List<NasaDataEntity>>> call(
    GetNasaDataParams params,
  ) async {
    try {
      final result = await datasource(params);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(DataSourceError(message: e.toString(), stackTrace: s));
    }
  }
}
