import 'package:ecommerce/app/pages/home/home_page.dart';
import 'package:ecommerce/app/pages/product/product_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrimaryModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
    ModularRouter('/product', child: (_, args) => ProductPage()),
  ];

  static Inject get to => Inject<PrimaryModule>.of();
}
