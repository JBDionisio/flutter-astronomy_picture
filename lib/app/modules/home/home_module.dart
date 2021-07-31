import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_nasa_data_usecase.dart';
import 'external/datasources/get_nasa_data_datasource.dart';
import 'infra/repositories/get_nasa_data_repository.dart';
import 'presenter/home_controller.dart';
import 'presenter/home_page.dart';
import 'presenter/home_store.dart';
import 'presenter/pages/detail_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController(i(), i())),
    Bind((i) => HomeStore()),

    //GetNasaData
    Bind((i) => GetNasaDataUsecase(i())),
    Bind((i) => GetNasaDataRepository(i())),
    Bind((i) => GetNasaDataDatasource(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute(
      '/detail',
      child: (_, args) => DetailPage(
        obj: args.data['nasaData'],
      ),
    ),
  ];
}
