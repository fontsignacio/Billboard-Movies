import 'package:flutter/material.dart';
import 'package:billboard_movies/common/http_handler.dart';
import 'package:billboard_movies/model/media.dart';
import 'package:billboard_movies/media_list_item.dart';


class Top extends StatefulWidget {
  const Top({super.key});

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  final List<Media> _media = [];

  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  void loadMovies()async{
    var movies = await HttpHandler().fetchTop();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _media.length,
      itemBuilder:  (context, index){
        return MediaListItem(media: _media[index]);
      }     
    );
  }
}