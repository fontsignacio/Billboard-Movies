import 'package:flutter/material.dart';/*
import 'package:billboard_movies/pages/top_page.dart';
import 'package:billboard_movies/common/http_handler.dart';
import 'package:billboard_movies/model/media.dart';
import 'package:billboard_movies/model/media_list_item.dart';
import 'package:billboard_movies/model/media_movie_overview.dart';*/

class TopTv extends StatelessWidget {
  const TopTv({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
/*
class TopTv extends StatefulWidget {
  const TopTv({super.key});

  @override
  State<TopTv> createState() => _TopTvState();
}

class _TopTvState extends State<TopTv> {
  final List<Media> _media = [];

  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  void loadMovies()async{
    var movies = await HttpHandler().fetchTvTop();
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
}*/