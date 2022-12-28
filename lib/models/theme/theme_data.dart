import 'package:flutter/material.dart';

import '../../theme/theme.dart';

enum THEME_MODE{
  LIGHT,DARK
}

class ThemeModes {
  THEME_MODE theme_mode;

  CustomTheme customTheme;

  ThemeData themeData;

  ThemeModes(this.theme_mode, this.customTheme, this.themeData);
}

ThemeModes? getThemeMode(THEME_MODE themeMode) {
  switch (themeMode) {
    case THEME_MODE.LIGHT:
      return ThemeModes(themeMode, CustomTheme.light(), lightThemeData);
    case THEME_MODE.DARK:
      return ThemeModes(themeMode, CustomTheme.dark(), darkThemeData);
    default:
      return null;
  }
}

CustomTheme? getColorTheme(THEME_MODE? themeMode) {
  switch (themeMode) {
    case THEME_MODE.LIGHT:
      return CustomTheme.light();
    case THEME_MODE.DARK:
      return CustomTheme.dark();
    default:
      return null;
  }
}

class DynamicColor<T> extends InheritedWidget {
  T? value;

  T get customColor => value!;

  DynamicColor({
    Key? key,
    @required this.value,
    @required Widget? child,
  }) : assert(value != null), assert(child != null), super(key: key, child: child!);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static DynamicColor of<T>(BuildContext context) {

    return context.dependOnInheritedWidgetOfExactType<DynamicColor<T>>()!;
  }
}
