import 'package:ecommerce/models/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/theme/colors.dart';

class CustomTheme {
  Color colorStatus1;
  Color colorStatus2;

  CustomTheme({required this.colorStatus1, required this.colorStatus2});

  factory CustomTheme.dark() {
    return CustomTheme(colorStatus1: Colors.red, colorStatus2: Colors.blue);
  }

  factory CustomTheme.light() {
    return CustomTheme(colorStatus1: Colors.white, colorStatus2: Colors.green);
  }

  static getCusTheme(THEME_MODE themeMode) {
    switch(themeMode) {
      case THEME_MODE.DARK:
        return CustomTheme.dark();
        break;
      case THEME_MODE.LIGHT:
        return CustomTheme.light();
        break;
      default:
        break;
    }
  }

}

final ThemeData lightThemeData = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  primaryColorDark: Colors.red,
  backgroundColor: Colors.white,
  accentColor: Colors.redAccent,
  bottomAppBarColor: Colors.white,
  textTheme: TextTheme(
    subtitle1: TextStyle(
      color: Colors.red,
      fontFamily: 'abc'
    ),
  ),
);

final ThemeData darkThemeData = ThemeData.dark().copyWith(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    primaryColorDark: Colors.red,
    backgroundColor: Colors.red,
    accentColor: Colors.red,
    bottomAppBarColor: Colors.white,
    textTheme: TextTheme(
        subtitle1: TextStyle(
            color: Colors.red,
            fontFamily: 'abc'
        )
    ).apply(
      bodyColor: AppColor.text
    )
);
