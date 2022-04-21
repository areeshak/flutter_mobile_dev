import 'package:flutter/material.dart';

class ReusableWidgetPage extends StatelessWidget {
  const ReusableWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            AreeshaWidget(
                title: 'Hello World',                                                       //make property in widget
                middle: 'AK',
                trailing: 'Google'
            ),
            AreeshaWidget(
                title: 'App Dev',
                middle: 'CS',
                trailing: 'Flutter'
            ),
          ],
        ),
      ),
    );
  }
}

class AreeshaWidget extends StatelessWidget {

  const AreeshaWidget({
    Key? key,
    this.title = '',
    required this.middle,                           //won't let uou move forward if not givem
    required this.trailing,
  }) : super(key: key);

  final String title;      //if not given= null                         //properties
  final String middle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Text('AK'), Text('Google'), Text('Hello'),
        Text(title),
        Text(middle),
        Text(trailing)
      ],
    );
  }
}
