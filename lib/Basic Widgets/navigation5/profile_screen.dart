import 'package:flutter/material.dart';

import 'profile.dart';

class ProfileScreen extends StatefulWidget {
  final Profile profile;
  const ProfileScreen({Key? key, required this.profile}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,               back button finish + anything leading
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.profile.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              widget.profile.email,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
