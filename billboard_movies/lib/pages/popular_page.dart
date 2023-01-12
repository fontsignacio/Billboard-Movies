import 'package:flutter/material.dart';
import 'package:billboard_movies/common/http_handler.dart';
import 'package:billboard_movies/model/media.dart';
import 'package:billboard_movies/model/media_list_movie.dart';
import 'package:billboard_movies/model/media_movie_overview.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  final List<Media> _media = [];
  
  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  void loadMovies()async{
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _media.length,
        itemBuilder:  (context, index) {
          return GestureDetector(
            child: MediaListItem(media: _media[index]),
            onTap: () {
              var router = MaterialPageRoute(
              builder: (context) => MediaOverview(media: _media[index]));
              Navigator.of(context).push(router);
            }
          );
        }
      ),
    );
  }
}