
import 'package:dwm14/components/searchBar.dart';
import 'package:dwm14/constants/firebase.dart';

import 'package:dwm14/components/drawer.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  String search = '';
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      drawer: DrawerMenu(),
      body: SafeArea(

        child: FutureBuilder(
            future: getMovies(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: // en attente
                  return Center(
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator()),
                  );
                default: // Future terminée
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('No movies'),
                    );
                  }
                  List totalmovies = snapshot.data;
                  List<String> moviesTitles = [];
                  for (var i = 0; i < totalmovies.length; i++) {
                    moviesTitles.add(totalmovies[i].title.toString());
                  }
                  //List movies= (sort != null) ? sortMovies(sort, totalmovies) : totalmovies;
                  //String title= (sort != null) ? sort : 'Movies';
                  return Container(
                    //height: 200,
                    //width: 200,
                  child:ListSearch(moviesTitles: moviesTitles, movies: totalmovies));/*Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: _textController,
                          onChanged: (value) {
                            setState(() {
                              search = value;
                            });
                          },
                        ),
                        Container(child: Text(search))
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  );*/
              }
            }),
      ),
    ));
  }
}
