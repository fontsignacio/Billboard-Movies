import 'package:flutter/material.dart';
import 'package:billboard_movies/api/http_handler.dart';
import 'package:billboard_movies/medias/media_movie.dart';
import 'package:billboard_movies/medias/media_list_movie.dart';
import 'package:billboard_movies/medias/media_movie_overview.dart';


class Coming extends StatefulWidget {
  const Coming({super.key});

  @override
  State<Coming> createState() => _ComingState();
}

class _ComingState extends State<Coming> {
  final List<Media> _media = [];
  final ScrollController _controllerOne = ScrollController();

  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  void loadMovies()async{
    var movies = await HttpHandler().fetchUpcoming();
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
          child: Text("Upcoming Movies",
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
