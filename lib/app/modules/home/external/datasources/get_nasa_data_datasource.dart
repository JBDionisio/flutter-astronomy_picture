import 'package:dio/dio.dart';

import '../../../../shared/errors/errors.dart';
import '../../../../shared/services/http_service/http_service.dart';
import '../../domain/entities/nasa_data_entity.dart';
import '../../domain/params/get_nasa_data_params.dart';
import '../../infra/i_datasourcers/i_get_nasa_data_datasource.dart';
import '../mappers/get_nasa_data_mapper.dart';

class GetNasaDataDatasource extends IGetNasaDataDatasource {
  final IHttpService _httpService;

  GetNasaDataDatasource(this._httpService);

  @override
  Future<List<NasaDataEntity>> call(GetNasaDataParams params) async {
    try {
      final _result = await _httpService.get(
        'https://api.nasa.gov/planetary/apod?api_key=8s4pckVwHlab7pUcZrybU06dnwBfzjcacajSwRVp',
        queryParameters: params.toBodyRequest(),
      );

      final _mapper = GetNasaDataMapper();
      final _finalResponse = _mapper.fromList(_result.data);
      return _finalResponse;
    } on DioError catch (e, s) {
      if (e.type == DioErrorType.connectTimeout) {
        throw SocketExceptionError(message: e.error, stackTrace: s);
      } else {
        throw ApiDataSourceError.fromError(e.response?.data, s);
      }
    } on MapperError {
      rethrow;
    } catch (e, s) {
      if (e is TypeError) {
        throw DataSourceError(
          message: 'TypeError: ${e.toString()}',
          stackTrace: s,
        );
      }
      throw DataSourceError(message: e.toString(), stackTrace: s);
    }
  }
}
