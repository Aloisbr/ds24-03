import 'package:flutter/material.dart';
import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/constants/firebase.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: FutureBuilder(
          future: getUserInfos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator()),
                );
              default:
                if (!snapshot.hasData) {
                  return Center(child: Text('Please Login'));
                }
                List userInfos = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    ListTile(
                      subtitle: Text('Name'),
                      title: Text(
                        userInfos[0].name,
                      ),
                    ),
                    ListTile(
                      subtitle: Text('First Name'),
                      title: Text(
                        userInfos[0].firstName,
                      ),
                    ),
                    ListTile(
                      subtitle: Text('Email'),
                      title: Text(userInfos[0].email),
                    ),
                    ListTile(
                      subtitle: Text('City'),
                      title: Text(userInfos[0].city),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Text('Sign Out',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      onTap: () async {
                        await firebaseAuth.signOut();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    )
                  ]),
                );
            }
          },
        ),
      ),
    );
  }
}
