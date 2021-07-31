import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';
import 'shared/services/http_service/http_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HttpService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashPage()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
