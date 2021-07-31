import '../../../shared/contracts/i_error.dart';
import '../../../shared/utils/app_state.dart';
import '../domain/entities/nasa_data_entity.dart';
import '../domain/params/get_nasa_data_params.dart';
import '../domain/usecases/get_nasa_data_usecase.dart';
import 'home_store.dart';

class HomeController {
  final HomeStore store;

  final GetNasaDataUsecase _getNasaData;

  HomeController(this.store, this._getNasaData) {
    _fetchNasaData();
  }

  Future<void> _fetchNasaData() async {
    store.fetchState = AppState.loading;
    final params = GetNasaDataParams(
      startDate: store.startDate,
      endDate: store.endDate,
    );
    final response = await _getNasaData.call(params);

    response.fold(
      _errorFetchNasaData,
      _okFetchNasaData,
    );
  }

  Future<void> _okFetchNasaData(List<NasaDataEntity> response) async {
    store.fetchState = AppState.success;

    store.list = response;
    store.filteredList = response;
  }

  Future<void> _errorFetchNasaData(IError response) async {
    store.fetchState = AppState.error;
  }
}
