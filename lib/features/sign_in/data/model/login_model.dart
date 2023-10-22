import 'package:chef_app_round_two/core/databases/api/end_points.dart';

class LoginModel {
  final String message;
  final String token;

  LoginModel({
    required this.message,
    required this.token,
  });
  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      message:jsonData[Apikeys.message] ,
      token:jsonData[Apikeys.token] ,
    );
  }
}
