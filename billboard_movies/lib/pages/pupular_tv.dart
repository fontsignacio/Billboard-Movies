import 'package:flutter/material.dart';/*
import 'package:billboard_movies/common/http_handler.dart';
import 'package:billboard_movies/model/media.dart';
import 'package:billboard_movies/model/media_list_tv.dart';
import 'package:billboard_movies/model/media_tv_overview.dart';*/


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
  final List<Media1> _media = [];

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
            child: MediaListTv(media: _media[index]),
            onTap: () {
              var router = MaterialPageRoute(
              builder: (context) => MediaOverviewTv(media: _media[index]));
              Navigator.of(context).push(router);
            }
          );
        }
      ),
    );
  }
}*/