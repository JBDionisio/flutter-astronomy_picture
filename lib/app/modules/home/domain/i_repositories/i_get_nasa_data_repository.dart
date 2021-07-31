import 'package:dartz/dartz.dart';

import '../../../../shared/contracts/i_error.dart';
import '../entities/nasa_data_entity.dart';
import '../params/get_nasa_data_params.dart';

abstract class IGetNasaDataRepository {
  Future<Either<IError, List<NasaDataEntity>>> call(GetNasaDataParams params);
}
