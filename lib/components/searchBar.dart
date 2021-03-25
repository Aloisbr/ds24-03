import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class ListSearch extends StatefulWidget {
  const ListSearch({
    this.moviesTitles,
    this.movies
  });
  final List moviesTitles;
  final List movies;

  @override
  ListSearchState createState() => ListSearchState(totalmovies: moviesTitles, newDataList: moviesTitles, movies: movies);
}


class ListSearchState extends State<ListSearch> {
  ListSearchState({
    this.totalmovies,
    this.newDataList,
    this.movies,
  });

  final List totalmovies;
  List<String> newDataList;
  final List movies;
  
  TextEditingController _textController = TextEditingController();


  // Copy Main List into New List.
  //List<String> newDataList = [];

  onItemChanged(String value) {
    setState(() {
      newDataList = totalmovies
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
          print(newDataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((title) {
                return ListTile(
                  title: Text(title),
                  onTap: ()=> {
                    for (var movie in movies) {
                      if(movie.title == title){
                        Navigator.pushNamed(
                          context, 
                          '/film',
                          arguments: ItemArguments(movie: movie)
                        )
                      }
                    }
                  },
                );
              }).toList(),
            ),
          )
        ],

    );
  }
}