//use provider so that everytime anywhere in the app changes take place only counter value gets updated on every required page and not re-build whole page

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class CounterPageWithProvider extends StatelessWidget {                   //this page won't update every time counter change
  const CounterPageWithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Count(),                                                     //call this widget
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().increment();                         //increment instance **
        },
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override                                                                   //this page should only have one instance hence make singleton class
  Widget build(BuildContext context) {
    return Text(context.watch<CounterProvider>().count.toString());             //watching if counter change  --> rebuild this widget   --> read the instance**
  }
}

