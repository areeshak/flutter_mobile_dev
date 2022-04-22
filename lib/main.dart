import 'package:flutter/material.dart';
import 'package:flutter_mobile_dev/Mini%20Projects/navigation6/contacts_list.dart';

import 'Basic Widgets/list_view1.dart';
import 'Basic Widgets/controller2.dart';
import 'Mini Projects/login3.dart';
import 'Basic Widgets/reusable_widget4.dart';
import 'Basic Widgets/navigation5/main_screen.dart';
import 'Mini Projects/navigation6/contacts_list.dart';
import 'Basic Widgets/callback7/display_value.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const DisplayValuePage(),
    );
  }
}