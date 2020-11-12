import 'package:ecommerce/app/pages/cart/cart_page.dart';
import 'package:ecommerce/app/pages/info_cart/info_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartModuleModule extends WidgetModule {
  GlobalKey<NavigatorState> _homeNavigator = GlobalKey();
  @override
  List<Bind> get binds => [];

  static Inject get to => Inject<CartModuleModule>.of();

  @override
  // TODO: implement view
  Widget get view => Navigator(
    key: _homeNavigator,
    initialRoute: '/',
    onGenerateRoute: generateRoute,
  );
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CartPage());
        break;
      case '/infoCart':
        return MaterialPageRoute(builder: (_) => InfoCartPage());
        break;
    }
  }
}