import 'package:flutter/material.dart';
import 'package:flutter_mobile_dev/Basic%20Widgets/state_management_provider11/counter.dart';
import 'package:provider/provider.dart';

import 'Basic Widgets/list_view1.dart';
import 'Basic Widgets/controller2.dart';
import 'Mini Projects/login3.dart';
import 'Basic Widgets/reusable_widget4.dart';
import 'Basic Widgets/navigation5/main_screen.dart';
import 'Mini Projects/navigation6/contacts_list.dart';
import 'Basic Widgets/callback7/display_value.dart';
import 'Basic Widgets/api_http8.dart';
import 'Mini Projects/cart9/dishes_list.dart';

import 'Basic Widgets/state_management_provider11/counter_provider.dart';

void main()
{
  runApp(                                                                   //singleton class
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
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
      home: const CounterPageWithProvider(),
    );
  }
}