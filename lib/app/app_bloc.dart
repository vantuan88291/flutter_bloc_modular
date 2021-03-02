import 'package:ecommerce/generated/l10n.dart';
import 'package:ecommerce/models/theme/theme_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import '../models/model.dart';

class AppBloc extends Disposable {
  final theme = BehaviorSubject<ThemeModes>();
  final loading = BehaviorSubject<bool>.seeded(false);
  final dataAlert = BehaviorSubject<DataAlert>();

  //dispose will be called automatically by closing its streams
  Sink<ThemeModes> get setTheme => theme.sink;
  Stream<ThemeModes> get getTheme => theme.stream;

  Function(bool) get setLoad => loading.sink.add;
  Stream<bool> get getLoad => loading.stream;

  Function(DataAlert) get setAlert => dataAlert.sink.add;

  Stream<DataAlert> get getAlert => dataAlert.stream;

  Future changTheme(THEME_MODE themeMode) async {
    setTheme.add(getThemeMode(themeMode));
  }

  success(String msg, {String title}) {
    DataAlert item = DataAlert(msg, title ?? S.current.success, TypeAlert.success, true);
    setAlert(item);
  }

  warn(String msg, {String title}) {
    DataAlert item = DataAlert(msg, title ?? S.current.warn, TypeAlert.warning, true);
    setAlert(item);
  }

  error(String msg, {String title}) {
    DataAlert item = DataAlert(msg, title ?? S.current.error, TypeAlert.error, true);
    setAlert(item);
  }

  clearAlert() {
    DataAlert item = dataAlert.value;
    item.setShow(null);
    setAlert(item);
  }

  @override
  void dispose() {
    theme.close();
    dataAlert.close();
    loading.close();
  }
}
