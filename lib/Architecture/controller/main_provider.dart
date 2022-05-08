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

    var userModel = UserModel.fromJson({                              //entry from database changed to first & last name
        "firstName" : "Areesha",
        "LastName" : "Kashif",
      });

                                      //now user model will convert to user object

    var user = User(name:  userModel.firstName + ' ' + userModel.lastName);   //need first and last name without changing ui --> concatenate both names and send as one name as to ui it doesn't matter how name is coming
    users.add(user);
    return users;
  }
}