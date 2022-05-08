import 'dart:convert';
import '../entities/user.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class MainProvider{                 //controller
  int counter = 0;
  List<User> users = [];

  void increment(){
    counter++;
  }


                                                                                                            //DATA FROM HTTP CALL --> not work as keys different (need to make changes in user model)
  Future<List<User>>  getUsers() async{

    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var list = jsonDecode(response.body) as List;                                //decode

    final userList = list.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();   //parse to user model


    var users = userList                                                  //user model list parsed to every user
        .map((e) => User(
      name: e.name,
    ))
        .toList();

    users.addAll(users);
    return users;                                                             //still returning users
  }
}