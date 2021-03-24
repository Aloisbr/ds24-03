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
                return Column(children: [
                  ListTile(
                      title: Text(
                    userInfos[0].name,
                  )),
                  ListTile(
                    title: Text(userInfos[0].email),
                  ),
                  ListTile(
                    title: Text(userInfos[0].city),
                  ),
                ]);
            }
          },
        ),
      ),
    );
  }
}
