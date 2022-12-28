import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/app_controller.dart';
import 'package:flutter_base_project/generated/l10n.dart';
import 'package:flutter_base_project/models/theme/theme_data.dart';
import 'package:flutter_base_project/theme/theme.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'widgets/loading_widget.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidget createState() => _AppWidget();
}
class _AppWidget extends State<AppWidget> {
  AppController appBloc = Modular.get<AppController>();
  Widget renderMain(snapshot) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: 'Base project',
    theme: snapshot.hasData
        ? snapshot.data.themeData
        : getThemeMode(THEME_MODE.LIGHT)?.themeData,
    darkTheme: darkThemeData,
    builder: (context, child) => Stack(
      alignment: Alignment.center,
      children: [
        child!,
        LoadingWidget(),
        DropdownAlert()
      ],
    ),
    routerDelegate: Modular.routerDelegate,
    routeInformationParser: Modular.routeInformationParser,
    localizationsDelegates: [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
  );
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeModes>(
      stream: appBloc.getTheme,
      builder: (context, snapshot) {
        return DynamicColor(
          value: getColorTheme(snapshot.hasData
              ? snapshot.data?.theme_mode
              : THEME_MODE.LIGHT),
          child: renderMain(snapshot),
        );
      },
    );
  }
}