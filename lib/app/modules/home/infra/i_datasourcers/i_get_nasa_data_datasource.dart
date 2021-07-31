import '../../domain/entities/nasa_data_entity.dart';
import '../../domain/params/get_nasa_data_params.dart';

abstract class IGetNasaDataDatasource {
  Future<List<NasaDataEntity>> call(GetNasaDataParams params);
}
