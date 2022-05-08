import 'dart:convert';
import '../entities/user.dart';
import '../models/user_model.dart';
import '../network_layer/network_call.dart';

class MainProvider{                 //controller
  int counter = 0;
  List<User> users = [];

  void increment(){
    counter++;
  }

                                                                                                         //DATA FROM API CALL
  Future<List<User>>  getUsers() async{                    //function called by UI



    //var response = await FirebaseApi.getUsers();
    //var list = response.data();                        //data from firebase
    //var userModelList = UserModel.fromJson(response.data());      // json parse in user model || this is user model list but UI needs users list  --> need to convert user model to user

    var userModel = UserModel.fromJson({"name" : "Areesha Kashif"});        //suppose this name is a *json object coming*/api response/ firebase response & we put it in user model
                //in this user model --> it has json keys

                                      //now user model will convert to user object
    var user = User(name:  userModel.name);

    users.add(user);
    return users;
  }
}