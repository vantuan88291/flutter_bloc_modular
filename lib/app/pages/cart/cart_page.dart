import 'package:ecommerce/app/widgets/button_widget.dart';
import 'package:ecommerce/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key key, this.title = "Cart"}) : super(key: key);

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
