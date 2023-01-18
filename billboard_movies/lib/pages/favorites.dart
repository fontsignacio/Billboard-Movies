import 'package:flutter/material.dart';
import 'package:billboard_movies/common/http_handler.dart';
import 'package:billboard_movies/media/media_movie.dart';
import 'package:billboard_movies/media/media_list_movie.dart';
import 'package:billboard_movies/media/media_movie_overview.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final List<Media> _suggestions = [];
  //final List<Media> _media = [];
  int count = 0;

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
              crossAxisCount: 3,
            ),
            padding: const EdgeInsets.all(10),
            itemBuilder:  (context, i) {
              if(i.isOdd) return const Divider();

              final index = i ~/2;
              if(index >= _suggestions.length){
                _suggestions.addAll(_suggestions);
              }
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
class Save extends StatelessWidget {
    const Save({super.key});
  
    @override
    Widget build(BuildContext context) {
      return _pushSaved();
    }
  

  Container _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        final tiles = _saved.map((pair){
            return ListTile(title: Text(pair.asPascalCase));
          }
        );

        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles
        ).toList();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Favorites"),
            backgroundColor: Colors.red,
          ),
          body: ListView(children: divided),
        );
      })
    );
  }
}*/