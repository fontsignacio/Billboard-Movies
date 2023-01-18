import 'package:billboard_movies/common/http_handler.dart';
import 'package:billboard_movies/media/media_list_search.dart';
import 'package:billboard_movies/media/media_movie_overview.dart';
import 'package:flutter/material.dart';
import 'package:billboard_movies/media/media_movie.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController controller = TextEditingController();
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                 if (!_isLoading) {
                return index == 0 ? _searchBar() :
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(  
                      child: MediaListSearch(media: mediaDisplay[index - 1]),
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
    );
  }
  _searchBar(){
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color:const Color(0xff292b37),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.search,
            color: Colors.white54,
            size: 30
          ),
          Container(
            width: 400,
            margin: const EdgeInsets.only(left: 5),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search your Favorite Movie",
                hintStyle: TextStyle(color: Colors.white54)
              ),
              onChanged: (String text) {
                text = text.toLowerCase();
                setState(() {
                  mediaDisplay = _media.where((u) {
                    var title = u.title.toLowerCase();
                    var generes = u.getGenres().toLowerCase();
                    return title.contains(text) || generes.contains(text);
                  }).toList();
                });
              }
            ),
          )
        ],
      ),             
    );
  }
}

