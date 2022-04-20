import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<String> names = ['Sara', 'Ahmed', 'Afeeqa', 'Rabia', 'Sonia'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(names[index]),
          subtitle: const Text('Hello'),
        ),
      ),
    );
  }
}
