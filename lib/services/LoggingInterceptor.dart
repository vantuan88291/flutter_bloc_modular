import 'package:dio/dio.dart';
import 'package:ecommerce/tool/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggingInterceptor extends Interceptor {
  int _maxCharactersPerLine = 200;

  @override
  Future onRequest(RequestOptions options) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(TOKEN);
    if (token != null) {
      options.headers.addAll({'Authorization': "Bearer ${token}"});
    }
    print("--> ${options.method} ${options.baseUrl}${options.path}");
    print("params: ${options.queryParameters}");
    print("<-- END HTTP");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "<--response: ${response.statusCode} ${response.request.method} ${response.request.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }
    print("<-- END HTTP");

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("<-- Error -->");
    print(err.error);
    print(err.message);
    return super.onError(err);
  }
}
