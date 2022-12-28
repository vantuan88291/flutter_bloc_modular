import 'package:dio/dio.dart';
import 'package:flutter_base_project/models/login/results_login.dart';
import 'package:flutter_base_project/tool/common.dart';
import 'LoggingInterceptor.dart';
import 'api_problem.dart';

class Api {
  late Dio _dio;
  static final Api _instance = Api._internal();

  factory Api() => _instance;

  Api._internal() {
    _dio = Dio();
    _dio.options.baseUrl = Common.BASE_API;
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.connectTimeout = 20000;
    _dio.interceptors.add(LoggingInterceptor());
  }

  get dio => _dio;

  Future<Map<String, dynamic>> handlerResponse(Future<Response> handle) async {
    try {
      Response response = await handle;
      return response.data;
    } on DioError catch (error) {
      print("res error---${error.response}");
      return handlerError(error);
    }
  }

  Future<ResultsLogin> doLogin() async {
    final request = _dio.post("login");
    final response = await handlerResponse(request);
    return ResultsLogin.fromJson(response);
  }
}
