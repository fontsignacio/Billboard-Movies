import 'package:flutter/material.dart';
import 'package:billboard_movies/medias/media_movie.dart';
import 'package:billboard_movies/api/http_handler.dart';
import 'package:billboard_movies/medias/media_list_search.dart';
import 'package:billboard_movies/medias/media_movie_overview.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.genre});
  final String genre;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Media> _media = [];
  List<Media> mediaDisplay = [];
  bool _isLoading = true;


  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  void loadMovies()async {
    var movie = await HttpHandler().fetchMovies();
    var movie1 = await HttpHandler().fetchTop();
    setState(() {
      _isLoading = false;
      _media.addAll(movie);
      _media.addAll(movie1);
      mediaDisplay = _media;
      mediaDisplay = _media.where((u) {
        var generes = u.getGenres().toLowerCase();
        return generes.contains(widget.genre.toLowerCase());
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilboard Movies"),
      ),
      body: Stack(
      children: [
        Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (!_isLoading) {
                    return index == 0 ?        
                     Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(widget.genre,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                          color: Colors.white )),
                      ) :
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(  
                          child: MediaListSearch(media: mediaDisplay[index - 1 ]),
                          onTap: () {
                            var router = MaterialPageRoute(
                            builder: (context) => MediaOverview(media: mediaDisplay[index - 1]));
                            Navigator.of(context).push(router);
                          }
                        )
                      );              
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.2,
                        ),
                        const Text('Loading ...', style: TextStyle(fontSize: 16.0, color: Colors.white)),
                      ],
                    );
                  }
                },
                itemCount: mediaDisplay.length + 1,
                )
              )
            ],
          ) 
        ]
      )
    );
  }
}