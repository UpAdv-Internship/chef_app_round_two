import 'package:chef_app_round_two/core/databases/api/end_points.dart';

class ResetPasswordModel {

  final String errorMessage;
  final int status;

  ResetPasswordModel( {
    required this.status,
    required this.errorMessage,
  });
  factory ResetPasswordModel.fromJson(Map<String, dynamic> jsonData) {
    return ResetPasswordModel(
      errorMessage: jsonData[Apikeys.errorMessage],
      status: jsonData[Apikeys.status],
    );
  }
}
