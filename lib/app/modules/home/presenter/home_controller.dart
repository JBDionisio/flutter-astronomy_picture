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
    fetchNasaData();
  }

  Future<void> fetchNasaData({bool isUpdate = false}) async {
    store.fetchState = AppState.loading;
    store.isUpdating = true;

    if (isUpdate) {
      updateDates();
    }

    final params = GetNasaDataParams(
      startDate: store.startDate,
      endDate: store.endDate,
    );
    final response = await _getNasaData.call(params);

    response.fold(
      _errorFetchNasaData,
      (r) => _okFetchNasaData(r, isUpdate),
    );
  }

  Future<void> _okFetchNasaData(
    List<NasaDataEntity> response,
    bool isUpdate,
  ) async {
    store.fetchState = AppState.success;

    store.list.addAll(response);
    store.filteredList.addAll(response);
    store.isUpdating = false;

    store.list.sort((a, b) => b.date.compareTo(a.date));
    store.filteredList.sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> _errorFetchNasaData(IError response) async {
    store.fetchState = AppState.error;
    store.isUpdating = false;
  }

  void filterImagesByTitle(String? value) {
    store.fetchState = AppState.loading;
    if (value != null && value.isNotEmpty) {
      store.filteredList = store.list
          .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      store.filteredList = store.list;
    }
    store.fetchState = AppState.success;
  }

  void updateDates() {
    store.endDate = store.startDate.subtract(Duration(days: 1));
    store.startDate = store.startDate.subtract(Duration(days: 4));
  }

  Future<void> resetData() async {
    store.endDate = DateTime.now();
    store.startDate = DateTime.now().subtract(Duration(days: 3));

    store.list.clear();
    store.filteredList.clear();

    await fetchNasaData();
  }
}
