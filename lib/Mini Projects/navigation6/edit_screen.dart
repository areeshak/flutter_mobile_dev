import 'package:flutter/material.dart';

import 'package:flutter_mobile_dev/Basic%20Widgets/navigation5/profile.dart';
import 'final_screen.dart';


class EditScreen extends StatefulWidget {

  final Profile editProfile;

  const EditScreen({Key? key, required this.editProfile}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String nameValue = "";
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  initState() {
    _controllerName.text = widget.editProfile.name;
    _controllerEmail.text = widget.editProfile.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controllerName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Edit your name"
              ),
            ),
            const Padding(padding: EdgeInsets.all(12)
            ),
            TextField(
              controller: _controllerEmail,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Edit your email"
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)
            ),
            ElevatedButton(
              onPressed: () {
                var saveDetails = Profile(name: _controllerName.text, email: _controllerEmail.text, initials: "");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FinalScreen(
                      finalProfile: saveDetails,                                //push updated profile details to final screen
                    ),
                  ),
                );
                setState(() {});
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
