import 'package:chef_app_round_two/core/databases/api/end_points.dart';

class CheckEmailModel {
  final String message;

  CheckEmailModel({
    required this.message,
  });
  factory CheckEmailModel.fromJson(Map<String, dynamic> jsonData) {
    return CheckEmailModel(message: jsonData[Apikeys.message]);
  }
}
