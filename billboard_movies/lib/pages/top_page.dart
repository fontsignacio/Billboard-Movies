import 'package:flutter/material.dart';
import 'package:billboard_movies/common/http_handler.dart';
import 'package:billboard_movies/model/media.dart';
import 'package:billboard_movies/model/media_list_movie.dart';
import 'package:billboard_movies/model/media_movie_overview.dart';

class Top extends StatefulWidget {
  const Top({super.key});

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  final List<Media> _media = [];
  final ScrollController _controllerOne = ScrollController();

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
    return Scaffold( 
      body: Stack(
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text("Top Movies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
            color: Colors.white )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 34),
          child: SizedBox(
            height: 225,
            child: Scrollbar(
              thumbVisibility: true,
              controller: _controllerOne,
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                
                controller: _controllerOne,
                itemCount: _media.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
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
              )
            )  
          ),
        ]
      )
    );
  }
}