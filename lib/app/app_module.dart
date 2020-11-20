import 'package:ecommerce/services/api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/app/app_widget.dart';

import 'app_bloc.dart';
import 'modules/authen/authen_module.dart';
import 'modules/primary/primary_module.dart';
import 'pages/routes.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((_) => AppBloc(), lazy: true),
        Bind((i) => Api()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: AuthenModule()),
        ModularRouter(Routes.primary, module: PrimaryModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
