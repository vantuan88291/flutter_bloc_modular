import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/modules/cart_module/cart_module_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(child: CartModuleModule())
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          elevation: 25,
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              label: "home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "home1",
              icon: Icon(Icons.business),
            ),
            BottomNavigationBarItem(
              label: "home2",
              icon: Icon(Icons.access_alarm),
            ),
          ]),
    );
  }
}
