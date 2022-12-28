import 'package:flutter/material.dart';
import 'package:flutter_base_project/tool/common.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  final String title;
  const LoadingPage({Key? key, this.title = "Loading"}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    remember();
  }
  remember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Common.TOKEN);
    if (token != null) {
      Modular.to.pushReplacementNamed('/primary');
    } else {
      Modular.to.pushReplacementNamed('/login');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }
}
