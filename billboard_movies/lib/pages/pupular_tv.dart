import 'package:flutter/material.dart';/*
import 'package:billboard_movies/common/http_handler.dart';
import 'package:billboard_movies/model/media.dart';
import 'package:billboard_movies/model/media_list_item.dart';
import 'package:billboard_movies/model/media_movie_overview.dart';*/


class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
/*
class PopularTv extends StatefulWidget {
  const PopularTv({super.key});

  @override
  State<PopularTv> createState() => _PopularTvState();
}

class _PopularTvState extends State<PopularTv> {
  final List<Media> _media = [];

  @override
  void initState(){
    super.initState();
    loadTv();
  }
  void loadTv()async{
    var tv = await HttpHandler().fetchTv();
    setState(() {
      _media.addAll(tv);
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