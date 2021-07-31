import 'package:rx_notifier/rx_notifier.dart';

import '../../../shared/utils/app_state.dart';
import '../domain/entities/nasa_data_entity.dart';

class HomeStore {
  final _fetchState = RxNotifier<AppState>(AppState.start);
  AppState get fetchState => _fetchState.value;
  set fetchState(AppState value) => _fetchState.value = value;

  final _startDate =
      RxNotifier<DateTime>(DateTime.now().subtract(Duration(days: 3)));
  DateTime get startDate => _startDate.value;
  set startDate(DateTime value) => _startDate.value = value;

  final _endDate = RxNotifier<DateTime>(DateTime.now());
  DateTime get endDate => _endDate.value;
  set endDate(DateTime value) => _endDate.value = value;

  final _list = RxNotifier<List<NasaDataEntity>>([]);
  List<NasaDataEntity> get list => _list.value;
  set list(List<NasaDataEntity> value) => _list.value = value;

  final _filteredList = RxNotifier<List<NasaDataEntity>>([]);
  List<NasaDataEntity> get filteredList => _filteredList.value;
  set filteredList(List<NasaDataEntity> value) => _filteredList.value = value;
}
