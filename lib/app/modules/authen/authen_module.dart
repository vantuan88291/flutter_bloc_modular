import 'package:ecommerce/app/pages/loading/loading_page.dart';
import 'package:ecommerce/app/pages/login/login_bloc.dart';
import 'package:ecommerce/app/pages/login/login_page.dart';
import 'package:ecommerce/app/pages/register/register_bloc.dart';
import 'package:ecommerce/app/pages/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginBloc(i()), isLazy: true, isSingleton: false),
    Bind((i) => RegisterBloc(), isLazy: true, isSingleton: false),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoadingPage()),
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute('/register', child: (_, args) => RegisterPage()),
  ];
}
