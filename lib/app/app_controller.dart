import 'package:flutter_base_project/models/theme/theme_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class AppController extends Disposable {
  final theme = BehaviorSubject<ThemeModes>();
  final loading = BehaviorSubject<bool>.seeded(false);

  //dispose will be called automatically by closing its streams
  Sink<ThemeModes> get setTheme => theme.sink;
  Stream<ThemeModes> get getTheme => theme.stream;

  Function(bool) get setLoad => loading.sink.add;
  Stream<bool> get getLoad => loading.stream;

  Future changTheme(THEME_MODE themeMode) async {
    setTheme.add(getThemeMode(themeMode)!);
  }

  @override
  void dispose() {
    theme.close();
    loading.close();
  }
}