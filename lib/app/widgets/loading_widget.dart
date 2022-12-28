import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/app_controller.dart';
import 'package:flutter_base_project/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';


class LoadingWidget extends StatefulWidget {
  @override
  StateLoadingWidget createState() => StateLoadingWidget();
}
class StateLoadingWidget extends State<LoadingWidget> {
  AppController? app;
  @override
  void initState() {
    app = Modular.get<AppController>();
    super.initState();
  }
  Widget renderLoading() => Scaffold(
    backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
    body: Center(
       child: CircularProgressIndicator(
         backgroundColor: Colors.red,
         valueColor: AlwaysStoppedAnimation<Color>(AppColor.grey),
       ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: app?.getLoad,
      builder: (context, value) {
        return value.data != null && value.data! ? renderLoading() : Container();
      },
    );
  }
}
