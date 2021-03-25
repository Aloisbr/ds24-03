import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:dwm14/screens/home.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key key, this.sort = 'all'}) : super(key: key);

  final String sort;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: // en attente
              return Center(
                child: SizedBox(
                    width: 30, height: 30, child: CircularProgressIndicator()),
              );
            default: // Future terminée
              if (!snapshot.hasData) {
                return Center(
                  child: Text('No movies'),
                );
              }
              List totalmovies = snapshot.data;
              List movies = totalmovies;
              if (sort != null) {
                movies = sortMovies(sort, totalmovies);
              }

              return Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Movies'),
                  Container(height: 350, child: ListMovie(movies: movies)),
                  Container(
                      color: Colors.red,
                      height: 200,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(sort: 'Crime')));
                            },
                            child: Container(
                              child: Text('Drama'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(sort: 'Drama')));
                            },
                            child: Container(
                              child: Text('Action'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(sort: 'Action')));
                            },
                            child: Container(
                              child: Text('Crime'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(sort: 'Thriller')));
                            },
                            child: Container(
                              child: Text('Thriller'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(sort: 'Crime')));
                            },
                            child: Container(
                              child: Text('Crime'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(sort: 'Fantasy')));
                            },
                            child: Container(
                              child: Text('Fantasy'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(sort: 'Sci-Fi')));
                            },
                            child: Container(
                              child: Text('Sci-Fi'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(sort: 'Adventure')));
                            },
                            child: Container(
                              child: Text('Adventure'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            child: Container(
                              child: Text('All'),
                            ),
                          ),
                        ],
                      ))
                ],
              ));
          }
        });
  }

  List sortMovies(String sort, List movies) {
    List sortMovies = [];
    for (var movie in movies) {
      if (movie.kind.contains(sort)) sortMovies.add(movie);
    }
    return sortMovies;
  }
}

class ListMovie extends StatelessWidget {
  const ListMovie({
    Key key,
    @required this.movies,
  }) : super(key: key);

  final List movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/film',
                    arguments: ItemArguments(movie: movies[index]));
              },
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(movies[index].poster))),
                  ),
                  Text(movies[index].title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(movies[index].year),
                ],
              ),
            ));
      },
    );
  }
}
