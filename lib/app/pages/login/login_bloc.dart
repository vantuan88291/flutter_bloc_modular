import 'package:flutter_base_project/app/app_controller.dart';
import 'package:flutter_base_project/models/login/results_login.dart';
import 'package:flutter_base_project/services/api.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';


class LoginBloc extends Disposable {
  final Api api;
  final AppController app = Modular.get<AppController>();
  LoginBloc(this.api);
  //dispose will be called automatically by closing its streams

  onLogin() async {
    app.setLoad(true);
    try {
      ResultsLogin data = await api.doLogin();
      if (data.code != 200) {
        AlertController.show("Error", data.message, TypeAlert.error);
      } else {
        AlertController.show("Success", data.message, TypeAlert.success);
        Modular.to.pushReplacementNamed('/primary');
      }
    } catch (e) {
      print(e);
      AlertController.show("Error", e.toString(), TypeAlert.error);
    }
    app.setLoad(false);
  }
  @override
  void dispose() {}
}
