import 'package:flutter/material.dart';
import '../controller/main_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainProvider mainProvider = MainProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(mainProvider.counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          mainProvider.increment();
          setState(() {

          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
