import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/prototypes/button_widget.dart';
import 'package:flutter_base_project/generated/l10n.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../prototypes/text_widget.dart';
import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc login = Modular.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextWidget("Login"),
          ButtonWidget(text: "Go register", onPress: () => Modular.to.pushNamed('/register'),),
          ButtonWidget(text: "Go main", onPress: () => Modular.to.pushNamed('/primary'),),
          ButtonWidget(text: S.current.call_api, onPress: login.onLogin,),
        ],
      ),
    );
  }
}
