import 'package:chef_app_round_two/core/databases/api/end_points.dart';

class SignUpModel {
  final String message;

  SignUpModel({
    required this.message,
  });
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(message: jsonData[Apikeys.message]);
  }
}
