import 'package:ecommerce/app/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrimaryModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
  ];

  static Inject get to => Inject<PrimaryModule>.of();
}
