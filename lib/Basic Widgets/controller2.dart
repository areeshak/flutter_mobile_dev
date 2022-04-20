import 'package:flutter/material.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({Key? key}) : super(key: key);

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int _counter = 0;
  String textValue = "";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter', //current counter value
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
                'My name is $textValue'), //variable value concatenated with string
            TextField(
              controller:
                  _controller, //controller contains value of the text field

              // onChanged: (value){                                            //on every change in text value changes value on the screen
              //   print(value);
              //   setState(() {
              //     textValue = value;
              //   });
              // }

            ),
            ElevatedButton(
              onPressed: () {
                textValue = _controller.text;
                setState(() {});
              },
              child: const Text(
                  'Update'), //will update name on the text when button pressed
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //update counter value
        onPressed: () {
          _counter++;
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
