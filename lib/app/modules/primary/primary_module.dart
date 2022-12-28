import 'package:flutter_base_project/app/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrimaryModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
