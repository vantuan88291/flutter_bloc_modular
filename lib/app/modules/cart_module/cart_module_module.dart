import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_base_project/app/pages/cart/cart_page.dart';
import 'package:flutter_base_project/app/pages/info_cart/info_cart_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartModuleModule extends WidgetModule {
  GlobalKey<NavigatorState> _homeNavigator = GlobalKey();
  @override
  List<Bind> get binds => [];

  @override
  // TODO: implement view
  Widget get view => Navigator(
    key: _homeNavigator,
    initialRoute: '/',
    onGenerateRoute: generateRoute,
  );
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CartPage());
      case '/infoCart':
        return MaterialPageRoute(builder: (_) => InfoCartPage());
    }
  }
}
