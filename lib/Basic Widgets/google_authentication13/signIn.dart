import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
import 'profile_details.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () async {
                User? user =
                await Authentication.signInWithGoogle(context: context);
                if (user != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileDetails(                                //navigate to profile screen
                        user: user,                                                 //pass this data to profile screen
                      ),
                    ),
                  );
                }
              },
              icon: const FaIcon(FontAwesomeIcons.google),
              label: const Text('Sign in with Google'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}