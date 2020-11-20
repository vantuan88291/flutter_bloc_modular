import 'package:ecommerce/app/pages/loading/loading_page.dart';
import 'package:ecommerce/app/pages/login/login_bloc.dart';
import 'package:ecommerce/app/pages/login/login_page.dart';
import 'package:ecommerce/app/pages/register/register_page.dart';
import 'package:ecommerce/app/pages/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginBloc(i()), lazy: true, singleton: false),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => LoadingPage()),
    ModularRouter(Routes.login, child: (_, args) => LoginPage()),
    ModularRouter(Routes.register, child: (_, args) => RegisterPage()),
  ];

  static Inject get to => Inject<AuthenModule>.of();
}
