class LoginParams {
  String phone;
  String password;
  String device_token;

  LoginParams({required this.phone, required this.password, required this.device_token});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['device_token'] = this.device_token;
    return data;
  }
}