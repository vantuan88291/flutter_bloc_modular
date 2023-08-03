import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/prototypes/button_widget.dart';
import '../../prototypes/text_widget.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key? key, this.title = "Cart"}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextWidget('in cart'),
          ButtonWidget(text: 'navigate new', onPress: () => Navigator.of(context).pushNamed('/infoCart'),)
        ],
      ),
    );
  }
}
