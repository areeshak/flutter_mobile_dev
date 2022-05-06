import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
import 'signIn.dart';

class ProfileDetails extends StatefulWidget {
  final User user;
  const ProfileDetails({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Material(
                child: Image.network(
                  widget.user.photoURL.toString(),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            Text(
              widget.user.displayName.toString(),
              style: const TextStyle(fontSize: 25),
            ),
            const Padding(
              padding: EdgeInsets.all(6),
            ),
            Text(widget.user.email.toString(),
                style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 25.0,
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                await Authentication.signOut(context: context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              backgroundColor: Colors.red,
              foregroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
