import 'package:chef_app_round_two/core/databases/api/end_points.dart';

class ChefModel {
  final String name;
  // final String phone;
  final String email;
  final String profilePic;

  ChefModel({
    required this.name,
    required this.email,
    required this.profilePic,
  });
  factory ChefModel.fromjson(Map<String, dynamic> jsonData) {
    return ChefModel(
      name: jsonData[Apikeys.name],
      email: jsonData[Apikeys.email],
      profilePic: jsonData[Apikeys.profilePic],
    );
  }
}
