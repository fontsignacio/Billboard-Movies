import 'package:flutter/material.dart';
import 'package:billboard_movies/medias/media_movie.dart';
import 'package:billboard_movies/medias/media_list_movie.dart';
import 'package:billboard_movies/medias/media_movie_overview.dart';
 
List<Media> _suggestions = [];

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

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
              crossAxisCount: 2,
              crossAxisSpacing: 45,
            ),
            itemCount: _suggestions.length,
            padding: const EdgeInsets.all(10),
            itemBuilder:  (context, index) {
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


class BuildFavorite extends StatefulWidget {
  const BuildFavorite({super.key, required this.media});
  final Media media;

  @override
  BuildFavoriteState createState() => BuildFavoriteState();
}

class BuildFavoriteState extends State<BuildFavorite> {

  @override
  Widget build(BuildContext context) {
    return buildRow(widget.media); 
  }

  
  Widget buildRow(Media media) {
    final bool alreadySaved = _suggestions.contains(media); 
    return GestureDetector(
      child: Icon(
        alreadySaved ? 
        Icons.favorite : Icons.favorite_border,
        color: Colors.white,
        size: 35),  
      
      onTap: () {
        setState(() {
          if(alreadySaved){
            _suggestions.remove(media);
          }else{
            _suggestions.add(media);   
          }       
        });
      }
    );   
  }
}
