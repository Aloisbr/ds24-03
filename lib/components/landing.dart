import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:dwm14/screens/home.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({
    Key key,
    this.sort= 'all'
  }) : super(key: key);

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
            List movies= (sort != null) ? sortMovies(sort, totalmovies) : totalmovies;
            String title= (sort != null) ? sort : 'Movies';
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 30),
                  Text(title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[500]
                    ),
                  ),
                  Container(
                    height: 350,
                    child: ListMovie(movies: movies)
                  ),
                  Sort()
                ],
              )
            );
        }
      });
  }

  List sortMovies(String sort, List movies){
    List sortMovies= [];
    for (var movie in movies) {
      if( movie.kind.contains(sort)) sortMovies.add(movie);
    }
    return sortMovies;
  }
}

class Sort extends StatelessWidget {
  const Sort({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton (
              
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => HomeScreen())
                    );
                  },
                  child: Container(
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton (
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => HomeScreen(sort: 'Drama'))
                    );
                  },
                  child: Container(
                    child: Text('Drama',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton (
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => HomeScreen(sort: 'Action'))
                    );
                  },
                  child: Container(
                    child: Text('Action',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton (
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => HomeScreen(sort: 'Thriller'))
                    );
                  },
                  child: Container(
                    child: Text('Thriller',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                  width: 150,
                  child: ElevatedButton (
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => HomeScreen(sort: 'Crime'))
                    );
                  },
                  child: Container(
                    child: Text('Crime',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton (
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => HomeScreen(sort: 'Fantasy'))
                    );
                  },
                  child: Container(
                    child: Text('Fantasy',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton (
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => HomeScreen(sort: 'Sci-Fi'))
                    );
                  },
                  child: Container(
                    child: Text('Sci-Fi',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton (
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => HomeScreen(sort: 'Adventure'))
                    );
                  },
                  child: Container(
                    child: Text('Adventure',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
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
              onTap: (){
                Navigator.pushNamed(
                  context, 
                  '/film',
                  arguments: ItemArguments(movie: movies[index])
                );
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
                  Text(
                    movies[index].title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    movies[index].year,
                    style: TextStyle(
                      fontSize: 10,
                    )
                  ),
                  Column(
                    children: List.generate(
                      movies[index].kind.length,
                      (indexKind) => Text(
                        movies[index].kind[indexKind],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        )
                      )
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
