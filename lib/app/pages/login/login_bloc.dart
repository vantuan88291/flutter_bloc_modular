import 'package:ecommerce/models/login/results_login.dart';
import 'package:ecommerce/services/api.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';

import '../../app_bloc.dart';

class LoginBloc extends Disposable {
  final Api api;
  final AppBloc app = Modular.get<AppBloc>();
  LoginBloc(this.api);
  //dispose will be called automatically by closing its streams

  onLogin() async {
    app.setLoad(true);
    ResultsLogin data = await api.doLogin();
    if (data.code != 200) {
      AlertController.show("Error", data.message, TypeAlert.error);
    } else {
      AlertController.show("Success", data.message, TypeAlert.success);
      Modular.to.pushReplacementNamed('/primary');
    }
    app.setLoad(false);
  }
  @override
  void dispose() {}
}
