import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/model.dart';
import '../app_bloc.dart';
import '../app_module.dart';
import 'button_widget.dart';
import 'text_widget.dart';

class AlertWidget extends StatefulWidget {
  @override
  StateAlertWidget createState() => StateAlertWidget();
}

class StateAlertWidget extends State<AlertWidget>
    with TickerProviderStateMixin {
  AppBloc app;
  AnimationController animationController;
  Animation animationPush;
  Timer _timer;

  @override
  void initState() {
    app = AppModule.to.get<AppBloc>();
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animationPush = Tween(begin: -100.0, end: 0.0).animate(animationController);
    app.getAlert.listen((event) {
      if (event != null) {
        animationController.forward();
        _timer = Timer(Duration(milliseconds: 2000), () {
          app.clearAlert();
        });
      } else {
        cancelTimer();
        animationController.reverse();
      }
    });
  }

  cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  onPress() {
    cancelTimer();
    app.clearAlert();
  }

  Widget renderMessage() => Positioned(
        top: animationPush.value,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ButtonWidget(
            radius: 0,
            padding: EdgeInsets.only(top: 36, bottom: 18, left: 10, right: 10),
            color: Colors.green,
            onPress: onPress,
            child: Align(
              alignment: Alignment.topLeft,
              child: StreamBuilder<DataAlert>(
                stream: app.getAlert,
                builder: (c, v) => Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(v.data?.title ?? '',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        SizedBox(
                          height: 6,
                        ),
                        TextWidget(v.data?.message ?? '',
                            style: TextStyle(color: Colors.white))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (c, v) => renderMessage(),
    );
  }
}
