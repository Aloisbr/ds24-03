import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class FilmScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final ItemArguments args = ModalRoute.of(context).settings.arguments;
    final Movie movie = args.movie;

    return Scaffold(
        appBar: AppBar(
          title: Text('Film details: ' + movie.title),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                      elevation: 10,
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Container(
                              height: 150,
                              width: 200,
                              child:
                                  Image.network(movie.poster, fit: BoxFit.cover)),
                          Text(movie.title,
                              style: TextStyle(
                                fontSize: 30,
                              )),
                          Text(movie.year,
                              style: TextStyle(
                                fontSize: 20,
                              ))
                        ],
                      )),
                  SizedBox(height: 30),
                  Container(
                    /*child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: movie.kind.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(movie.kind[index]),
                        );
                      },
                    ),*/
                  ),
                  Text(movie.kind.join(', ')),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(movie.plot),
                  ),
                  SizedBox(height: 30),
                  Text( movie.actors.join(', ')),
                  SizedBox(height: 30),
                  Row(
                    children:[
                      Container(
                        child: Column(children: [
                          Text('critics')
                        ]
                          
                        ),
                      )
                    ]
                  )

                  

                ],
              ),
            ),
          ),
        ));
  }

  String lsToString(List<dynamic> list) {
    String str = '';
    for (var i = 0; i < list.length; i++) {
      str += list[i];
      if (i < list.length - 1) str += ', ';
    }
    return str;
  }

  lsToSubList(List<dynamic> list) {
    int mid = (list.length / 2).ceil();
    List ls1 = [];
    for (var i = 0; i < mid; i++) {
      ls1.add(list[i]);
    }
    List ls2 = [];
    for (var i = mid; i < list.length; i++) {
      ls2.add(list[i]);
    }
    return [ls1, ls2];
  }
}
