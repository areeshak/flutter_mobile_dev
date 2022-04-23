//fetch users through HTTP API call

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpUsersPage extends StatefulWidget {
  const HttpUsersPage({Key? key}) : super(key: key);

  @override
  State<HttpUsersPage> createState() => _HttpUsersPageState();
}

class _HttpUsersPageState extends State<HttpUsersPage> {

  List<User> _users = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API call"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(                                                       //takes all available space along main-axis ==> /*used because placing list in column
              child:ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index){
                    return ListTile(
                        title: Text(_users[index].name),
                        subtitle: Text(_users[index].email)
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(                               //Floating action button will get users
        onPressed: () async {
          await _fetchUsers();
        },
        tooltip: 'Show Users',
        child: const Icon(Icons.details),
      ),
    );
  }

  Future _fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);

    final hello = jsonDecode(response.body) as List;

    var users = hello.map((e) => User(name: e['name'], email: e['email'])).toList();          //mapping to user type list
    _users = users;
    setState(() {

    });
  }
}

class User{
  final String name;
  final String email;

  User({required this.name, required this.email});
}
