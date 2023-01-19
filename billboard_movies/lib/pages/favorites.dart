import 'package:flutter/material.dart';
import 'package:billboard_movies/api/http_handler.dart';
import 'package:billboard_movies/medias/media_movie.dart';
import 'package:billboard_movies/medias/media_list_movie.dart';
import 'package:billboard_movies/medias/media_movie_overview.dart';
 


/*
class FavoriteMoviesScreen extends StatefulWidget {
  @override
  _FavoriteMoviesScreenState createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  List<Movie> movieList;
  int count = 0;
  DatabaseController databaseController = DatabaseController();
  @override
  void initState() {
    super.initState();
    setData();
  }

  Future<void> setData() async {
    movieList = await databaseController.getMovieList();
    if (mounted) {
      setState(() {
        count = movieList.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Future<void> getDetail(Movie movie) async {
    bool fav = await databaseController.contain(movie.id);
    Movie exploreMovie;
    if (movie.posterPath == null) {
      exploreMovie = Movie(movie.id, movie.title, movie.genre, fav);
    } else {
      exploreMovie =
          Movie(movie.id, movie.title, movie.genre, fav, movie.posterPath);
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailScreen(exploreMovie),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Container body() {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              onTap: () {
                getDetail(movieList[index]);
              },
              leading: movieList[index].posterPath == null
                  ? Icon(Icons.broken_image)
                  : Image.network(movieList[index].posterPath,
                      width: 50.0, height: 50.0),
              title: Text(movieList[index].title),
              subtitle: Text(
                movieList[index].genre,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: GestureDetector(
                  child: Icon(Icons.delete, color: Colors.red),
                  onTap: () {
                    databaseController.deleteMovie(movieList[index].id);
                    movieList[index].favorite = false;
                    if (mounted) {
                      setState(() {
                        setData();
                      });
                    }
                  }));
        },
        itemCount: count,
      ),
    );
  }
}
*/

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final List<Media> _suggestions = [];

  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  
  void loadMovies()async{
    var movie = await HttpHandler().fetchMovies();
    setState(() {
      _suggestions.addAll(movie);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text("Favorites",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
            color: Colors.white )),
        ),
        Container(
          padding: const EdgeInsets.only(top: 34),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 45,
            ),
            itemCount: _suggestions.length,
            padding: const EdgeInsets.all(10),
            itemBuilder:  (context, index) {
              return GestureDetector(
                child: MediaListItem(media: _suggestions[index]),
                onTap: () {
                    var router = MaterialPageRoute(
                    builder: (context) => MediaOverview(media: _suggestions[index]));
                    Navigator.of(context).push(router);
                  }
                );
              }
            ),
          )
        ]
      )
    );
  }
}

/*

class BuildFavorite extends StatefulWidget {
  const BuildFavorite({super.key, required this.media});
  final Media media;

  @override
  BuildFavoriteState createState() => BuildFavoriteState();
}

class BuildFavoriteState extends State<BuildFavorite> {
  //final List<Media> _media = [];
  List<Media> _suggestions = [];

  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  
  void loadMovies()async{
    setState(() {
      _suggestions.add(media);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _suggestions.length,
      itemBuilder: (context, index){
        return buildRow(_suggestions[index]);  
      }
    );
  }

  
Widget buildRow(Media media) {
  final bool alreadySaved = _media.contains(media); 
  return GestureDetector(
    child: Icon(
      alreadySaved ? 
      Icons.favorite : Icons.favorite_border,
      color: Colors.white,
      size: 35),  
    
    onTap: () {
      setState(() {
        if(alreadySaved){
          _media.remove(media);
        }else{
          _media.add(media);   
        }       
      });
    });   
  }
}*/
