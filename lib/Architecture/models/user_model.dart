class UserModel {
  //now user name from database is coming as first name as last name
  final String firstName;
  final String lastName;

  UserModel({
    required this.firstName,
    required this.lastName,
  });

  static fromJson(Map<String, dynamic> json) {                                  //json(map) from outside will convert here and will return user model object
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}