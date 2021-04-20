import 'package:ecommerce/services/api.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_bloc.dart';
import 'modules/authen/authen_module.dart';
import 'modules/primary/primary_module.dart';
import 'pages/routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AppBloc()),
        Bind((i) => Api()),
      ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: AuthenModule()),
    ModuleRoute(Routes.primary, module: PrimaryModule()),
      ];
}
