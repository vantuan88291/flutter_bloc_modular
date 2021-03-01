import 'package:ecommerce/models/login/results_login.dart';
import 'package:ecommerce/services/api.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';

class LoginBloc extends Disposable {
  final Api api;
  final AppBloc app = AppModule.to.get<AppBloc>();
  LoginBloc(this.api);
  //dispose will be called automatically by closing its streams

  onLogin() async {
    app.setLoad(true);
    ResultsLogin data = await api.doLogin();
    if (data.code != 200) {
      app.success(data.message);
    } else {
      app.error(data.message);
      Modular.to.pushReplacementNamed('/primary');
    }
    app.setLoad(false);
  }
  @override
  void dispose() {}
}
