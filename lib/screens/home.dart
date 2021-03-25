import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/components/landing.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    this.sort
  }): super(key: key);
  final String sort;
  
  @override
  _HomeScreenState createState() => _HomeScreenState(sort: sort);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({
    this.sort
  });
  final String sort;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Movie'),
      ),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
              child: SafeArea(
          child: Landing(sort: sort)
        ),
      ),
    );
  }
}
