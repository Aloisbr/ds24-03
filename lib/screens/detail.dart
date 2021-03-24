import 'package:first/components/drawer.dart';
import 'package:first/models/movie.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final ItemArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          actions: [
            Icon(Icons.edit),
          ],
        ),
        drawer: DrawerMenu(),
        body: SafeArea(child: Text(args.text)));
  }
}
