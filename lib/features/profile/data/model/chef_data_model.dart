
class ChefModel {
  final String profilePic;
  final String name;
  final String phone;
  final Map<String, dynamic> location;
  final String brandName;
  final int minCharge;
  final String disc;
  final String email;

  ChefModel({
    required this.phone,
    required this.location,
    required this.brandName,
    required this.minCharge,
    required this.disc,
    required this.name,
    required this.email,
    required this.profilePic,
  });
  factory ChefModel.fromjson(Map<String, dynamic> jsonData) {
    return ChefModel(
      phone: jsonData['phone'],
      location: jsonData['location'],
      brandName: jsonData['brandName'],
      minCharge: jsonData['minCharge'],
      disc: jsonData['disc'],
      name: jsonData['name'],
      email: jsonData['email'],
      profilePic: jsonData['profilePic'],
    );
  }
}
