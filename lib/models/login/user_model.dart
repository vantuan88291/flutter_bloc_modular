class UserModel {
  late int minBalance;
  late String avatar;
  late int userId;
  late String email;
  late String phone;
  late String fullName;
  late String aboutMe;
  late int currentBalance;
  late int statusDiscount;
  late String appLogo;
  late String appName;
  late String appDescription;
  late String accountHolder;
  late String accountNumber;
  late String bankName;
  late String branch;
  late String token;
  late int minRevenue;
  late int revenue;

  UserModel(
      this.minBalance,
      this.avatar,
      this.userId,
      this.email,
      this.phone,
      this.fullName,
      this.aboutMe,
      this.currentBalance,
      this.statusDiscount,
      this.appLogo,
      this.appName,
      this.appDescription,
      this.accountHolder,
      this.accountNumber,
      this.bankName,
      this.branch,
      this.token,
      this.minRevenue,
      this.revenue
      );

  UserModel.fromJson(Map<String, dynamic> json) {
    minBalance = json['min_balance'];
    avatar = json['avatar'];
    userId = json['user_id'];
    email = json['email'];
    phone = json['phone'];
    fullName = json['full_name'];
    aboutMe = json['about_me'];
    currentBalance = json['current_balance'];
    statusDiscount = json['status_discount'];
    appLogo = json['app_logo'];
    appName = json['app_name'];
    appDescription = json['app_description'];
    accountHolder = json['account_holder'];
    accountNumber = json['account_number'];
    bankName = json['bank_name'];
    branch = json['branch'];
    token = json['token'];
    minRevenue = json['min_revenue'];
    revenue = json['revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_balance'] = this.minBalance;
    data['avatar'] = this.avatar;
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['full_name'] = this.fullName;
    data['about_me'] = this.aboutMe;
    data['current_balance'] = this.currentBalance;
    data['status_discount'] = this.statusDiscount;
    data['app_logo'] = this.appLogo;
    data['app_name'] = this.appName;
    data['app_description'] = this.appDescription;
    data['account_holder'] = this.accountHolder;
    data['account_number'] = this.accountNumber;
    data['bank_name'] = this.bankName;
    data['branch'] = this.branch;
    data['token'] = this.token;
    data['min_revenue'] = this.minRevenue;
    data['revenue'] = this.revenue;
    return data;
  }
}