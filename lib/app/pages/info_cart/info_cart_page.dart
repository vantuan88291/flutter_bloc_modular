import 'package:flutter/material.dart';
import '../../prototypes/text_widget.dart';

class InfoCartPage extends StatefulWidget {
  final String title;
  const InfoCartPage({Key? key, this.title = "InfoCart"}) : super(key: key);

  @override
  _InfoCartPageState createState() => _InfoCartPageState();
}

class _InfoCartPageState extends State<InfoCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextWidget('Cart info here')
        ],
      ),
    );
  }
}
