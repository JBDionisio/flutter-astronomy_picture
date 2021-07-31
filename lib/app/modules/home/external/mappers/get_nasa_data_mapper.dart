import '../../domain/entities/nasa_data_entity.dart';
import '../mappers_error/get_nasa_data_mapper_error.dart';

class GetNasaDataMapper {
  List<NasaDataEntity> fromList(List json) {
    try {
      return List<NasaDataEntity>.from(
        json.map(
          (e) => NasaDataEntity(
            title: e['title'],
            url: e['url'],
            explanation: e['explanation'],
            copyright: (e['copyright'] != null) ? e['copyright'] : null,
            date: DateTime.parse(e['date']),
          ),
        ),
      );
    } catch (e, s) {
      throw GetNasaDataMapperError(
        errorMessage: e.toString(),
        stackTrace: s,
      );
    }
  }
}
