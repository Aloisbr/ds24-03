import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              children: [
                Text('Active Color'),
              ],
            ),
          ),
          ListTile(
            title: Text('Detail'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/detail',
                  arguments: ItemArguments(text: 'Detail Screen'));
            },
          ),
          ListTile(
            title: Text('User Infos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/user/infos');
            },
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('Sign up'),
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          ListTile(
            title: Text('Sign Out',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () async {
              await firebaseAuth.signOut();
              Navigator.pushReplacementNamed(context, '/connect');
            },
          ),
        ],
      )),
    );
  }
}
