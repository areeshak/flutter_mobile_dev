import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'profile.dart';


class NavigationMainScreenPage extends StatefulWidget {
  const NavigationMainScreenPage({Key? key}) : super(key: key);

  @override
  State<NavigationMainScreenPage> createState() => _NavigationMainScreenPageState();
}

class _NavigationMainScreenPageState extends State<NavigationMainScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.waving_hand,
                size: 40,),
                Text(
                  'Hello!',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Text(
              'Click on the button below to see your profile details',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(onPressed: (){
              var profile = Profile(name: "Areesha Kashif", email: "ahdfd@gmail.com");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(                                //navigate to profile screen
                    profile: profile,                                                 //pass this data to profile screen
                  ),
                ),
              );
            }, child: const Text("Click Me"))
          ],
        ),
      ),
    );
  }
}