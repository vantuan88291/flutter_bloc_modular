import 'user_model.dart';

class ResultsLogin {
  final UserModel? data;
  final String message;
  final int code;

  ResultsLogin(this.data, this.message, this.code);

  ResultsLogin.fromJson(Map<String, dynamic> json)
      : data = json['data'] != null ? UserModel.fromJson(json['data']) : null,
        message = json["message"],
        code = json["code"];
}