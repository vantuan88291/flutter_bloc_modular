import 'package:dio/dio.dart';
import 'package:flutter_base_project/tool/common.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

doExpires() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(Common.TOKEN);
  Modular.to.pushReplacementNamed('/login');
}
handlerError(error) {
  if (error is DioError) {
    DioError dioError = error as DioError;
    switch (dioError.type) {
      case DioErrorType.cancel:
        return {
          'code': 501,
          'message': "Request to API server was cancelled"
        };
      case DioErrorType.connectTimeout:
        return {'code': 502, 'message': "Connection timeout with API server"};
      case DioErrorType.other:
        return {
          'code': 503,
          'message':
          "Connection to API server failed due to internet connection"
        };
      case DioErrorType.receiveTimeout:
        return {
          'code': 504,
          'message': "Receive timeout in connection with API server"
        };
      case DioErrorType.response:
        switch(dioError.response?.statusCode) {
          case 404:
            return {
              'code': dioError.response?.statusCode,
              'message': dioError.response?.statusMessage
            };
          case 401:
            final msg = dioError.response?.data['message'] ?? "";
            if (msg.contains('token')) {
              doExpires();
            }
            return dioError.response?.data;
          default:
            return dioError.response?.data;
        }
        break;
      case DioErrorType.sendTimeout:
        return {
          'code': 505,
          'message': "Send timeout in connection with API server"
        };
    }
  }
  return {'code': 500, 'message': "Unexpected error occured"};
}