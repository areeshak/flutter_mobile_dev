//add users to collection in firebase database

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';        //Firebase Android Setup

class FirebaseUsersPage extends StatefulWidget {
  const FirebaseUsersPage({Key? key}) : super(key: key);

  @override
  State<FirebaseUsersPage> createState() => _FirebaseUsersPageState();
}

class _FirebaseUsersPageState extends State<FirebaseUsersPage> {


  final List<User> _users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_users[index].name),
              subtitle: Text(_users[index].email),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          addUser();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    CollectionReference users = FirebaseFirestore.instance.collection('users');                     //collection name
    final user = User(name: 'Areesha', email: 'areesha@gmail.com');                               //add this user to database
    users                                                                                           //collection name
        .add(user.toJson())                                                                         //add function takes a map as parameter
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void getUsers() {
    setState(() {});
    FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _users.add(User.fromJson(doc.data() as Map<String, dynamic>));
      });
      setState(() {});
    });
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
  //add user
  Map<String, dynamic> toJson() {                               //covert its item(name&email) to json --> toJson function to map to json
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;

    return data;
  }

  static User fromJson(Map<String, dynamic> json) => User(      //get user
    name: json['name'] ?? '',
    email: json['email'] ?? '',
  );
}