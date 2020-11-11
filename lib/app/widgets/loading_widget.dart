import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';

import '../app_bloc.dart';
import '../app_module.dart';

class LoadingWidget extends StatefulWidget {
  @override
  StateLoadingWidget createState() => StateLoadingWidget();
}
class StateLoadingWidget extends State<LoadingWidget> {
  AppBloc app;
  @override
  void initState() {
    app = AppModule.to.get<AppBloc>();
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
      stream: app.getLoad,
      builder: (context, value) {
        return value.data != null && value.data ? renderLoading() : Container();
      },
    );
  }
}
