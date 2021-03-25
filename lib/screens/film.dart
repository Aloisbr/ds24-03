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
                  SizedBox(height: 30),
                  CardMovie(movie: movie),
                  SizedBox(height: 25),
                  Text(
                    movie.kind.join(', '),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800]
                    )
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      movie.plot,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800]
                      )
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'Actors :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Text(
                        movie.actors.join(', '),
                        style: TextStyle(
                          fontSize: 14,
                        )
                      )
                    ),
                  ),
                  SizedBox(height: 30),
                  Rating(movie: movie),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ));
  }
}

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.65,
                child:
                    Image.network(movie.poster, fit: BoxFit.cover)),
            Text(movie.title,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[700]
                )),
            Text(movie.year,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ))
          ],
        ));
  }
}

class Rating extends StatelessWidget {
  const Rating({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        Container(
          child: Column(children: [
            Image.network(
              movie.ratings[0]['logo'], 
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.25,
            ),
            SizedBox(height: 20),
            Text(movie.ratings[0]['source']),
            SizedBox(height: 10),
            Text(
              movie.ratings[0]['value'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
          ]),
        ),
        
        Container(
          child: Column(children: [
            Image.network(
              movie.ratings[2]['logo'], 
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.25,
            ),
            SizedBox(height: 20),
            Text(movie.ratings[2]['source']),
            SizedBox(height: 10),
            Text(
              movie.ratings[2]['value'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
          ]),
        ),

        Container(
          child: Column(children: [
            Image.network(
              movie.ratings[1]['logo'], 
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.25,
            ),
            SizedBox(height: 20),
            Text(movie.ratings[1]['source']),
            SizedBox(height: 10),
            Text(
              movie.ratings[1]['value'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
          ]),
        ),
      ]
    );
  }
}
