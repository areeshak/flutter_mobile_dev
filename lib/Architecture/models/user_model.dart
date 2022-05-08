class UserModel {
  final String name;

  UserModel({
    required this.name
  });

  static fromJson(Map<String, dynamic> json) {                                  //json(map) from outside will convert here and will return user model object
    return UserModel(
      name: json['name'],
    );
  }
}