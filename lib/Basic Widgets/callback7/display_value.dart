//any changes made to counter value on second page will show on the first page
import 'package:flutter/material.dart';
import 'package:flutter_mobile_dev/Basic%20Widgets/callback7/update_value.dart';

class DisplayValuePage extends StatefulWidget {
  const DisplayValuePage({Key? key}) : super(key: key);

  @override
  State<DisplayValuePage> createState() => _DisplayValuePageState();
}

class _DisplayValuePageState extends State<DisplayValuePage> {
  int _counter = 0;
  String myText = '';
  final TextEditingController _controller = TextEditingController();
  bool isTextFieldVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter 1"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    _counter.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _counter++;
                      setState(() {});
                    },
                    child: const Text('Increment'),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UpdateValuePage(                    //go to page 2 via floating button
                counter: _counter,
                onCounterUpdated: (value) {
                  _counter = value;                                     //get value from page 2 and assign it to current page counter value
                  setState(() {});
                },
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
