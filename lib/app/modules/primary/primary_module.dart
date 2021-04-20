import 'package:ecommerce/app/pages/home/home_page.dart';
import 'package:ecommerce/app/pages/product/product_page.dart';
import 'package:ecommerce/app/pages/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrimaryModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute(Routes.product, child: (_, args) => ProductPage()),
  ];
}
