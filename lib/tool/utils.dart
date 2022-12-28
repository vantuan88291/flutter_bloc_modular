import 'package:intl/intl.dart';

class Utils {
  static String getPrice(int price, {bool currency = true}) {
    if (price <= 0) {
      return currency != null ? "0đ" : "0";
    }
    try {
      final newPrice = NumberFormat.currency(locale: 'vi', symbol: '').format(price).trim();
      return currency != null ? "${newPrice}đ" : newPrice;
    } catch (e) {
      return "0đ";
    }
  }

  static final RegExp patternEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static bool isEmail(String email) {
    return patternEmail.hasMatch(email);
  }
}
