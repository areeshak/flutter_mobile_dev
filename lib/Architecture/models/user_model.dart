class UserModel {
  final String name;

  UserModel({
    required this.name
  });

  static fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
    );
  }
}