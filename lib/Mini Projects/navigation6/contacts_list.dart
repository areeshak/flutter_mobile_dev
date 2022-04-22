//click on any profile to edit details
//after clicking on the profile --> navigate to edit profile screen which displays selected profile details

import 'package:flutter/material.dart';

import 'package:flutter_mobile_dev/Basic Widgets/navigation5/profile.dart';
import 'edit_screen.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({Key? key}) : super(key: key);

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  List<Profile> details = [
    Profile(initials: 'SS', name: 'Sana Samad', email: 'sana@gmail.com'),
    Profile(initials: 'AS', name: 'Ayesh Samad', email: 'ayesha123@gmail.com'),
    Profile(initials: 'AK', name: 'Areesha Kashif', email: 'areesha.k@gmail.com'),
    Profile(initials: 'RY', name: 'Rabeya Yousuf', email: 'rabeya.bg@gmail.com'),
    Profile(initials: 'SZ', name: 'Shomail Zara', email: 'shomail.zf@gmail.com'),
  ];

  int _selectedIndex = 0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator"),
      ),
      body: ListView.builder(
        itemCount: details.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(2),
            shape: Border.all(color: Colors.black),
            child: ListTile(
              leading: CircleAvatar(child: Text(details[index].initials)),
              title: Text(details[index].name),
              subtitle: Text(details[index].email),
              trailing: const Icon(Icons.arrow_forward_sharp),
              onTap: () {
                isSelected = true;
                setState(() {
                  _selectedIndex = index;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditScreen(
                      editProfile: details[_selectedIndex],                     //selected profile data pushed to edit screen
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
