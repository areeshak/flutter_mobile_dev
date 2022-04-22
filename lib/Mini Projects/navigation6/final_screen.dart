//show edited details of the profile

import 'package:flutter/material.dart';

import 'package:flutter_mobile_dev/Basic%20Widgets/navigation5/profile.dart';


class FinalScreen extends StatefulWidget {
  final Profile finalProfile;
  const FinalScreen({Key? key, required this.finalProfile}) : super(key: key);

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.finalProfile.name,
              style: const TextStyle(fontSize: 18),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              widget.finalProfile.email,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
