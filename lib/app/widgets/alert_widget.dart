import 'package:flutter/material.dart';

import '../app_bloc.dart';
import '../app_module.dart';

class AlertWidget extends StatefulWidget {
  @override
  StateAlertWidget createState() => StateAlertWidget();
}
class StateAlertWidget extends State<AlertWidget> {
  AppBloc app;
  @override
  void initState() {
    app = AppModule.to.get<AppBloc>();
    app.getMessage.listen((event) {
      if(event != null && event != '') {
        Future.delayed(const Duration(milliseconds: 3000), () {
          app.setMessage('');
        });
      }
    });
    super.initState();
  }
  onPress() {
    app.setMessage('');
  }
  Widget renderMessage(String msg) => Positioned(
    bottom: 20,
    child: SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      child: FlatButton(
        color: Colors.black54,
        onPressed: onPress,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(msg, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: app.getMessage,
      builder: (context, value) {
        return value.data != null && value.data != '' ? renderMessage(value.data) : Container();
      },
    );
  }
}
