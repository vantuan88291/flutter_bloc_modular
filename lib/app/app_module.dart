import 'package:flutter_base_project/app/app_controller.dart';
import 'package:flutter_base_project/app/modules/authen/authen_module.dart';
import 'package:flutter_base_project/app/modules/primary/primary_module.dart';
import 'package:flutter_base_project/services/api.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppController()),
    Bind((i) => Api()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthenModule()),
    ModuleRoute('/primary', module: PrimaryModule()),
  ];

}