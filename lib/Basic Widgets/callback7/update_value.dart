import 'package:flutter/material.dart';

class UpdateValuePage extends StatefulWidget {
  final Function(int) onCounterUpdated; //return counter value
  final int counter;

  const UpdateValuePage({
    Key? key,
    required this.counter,
    required this.onCounterUpdated,
  }) : super(key: key);

  @override
  _UpdateValuePageState createState() => _UpdateValuePageState();
}

class _UpdateValuePageState extends State<UpdateValuePage> {
  int myCounter = 0;                                      //create a variable to make changes in UI

  @override
  void initState() {
    // TODO: implement initState
    super.initState();                                  //initial counter value when page load
    myCounter = widget.counter;                         //save initial counter value from previous page to this variable
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myCounter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(                                   //change counter value on page 2
              onPressed: () {
                myCounter++;
                setState(() {});
                widget.onCounterUpdated(myCounter);           //pass updated counter value
              },
              child: const Text('Reassign counter'),
            ),
          ],
        ),
      ),
    );
  }
}
