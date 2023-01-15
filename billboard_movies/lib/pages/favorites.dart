import 'package:flutter/material.dart';
/*

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final List<Media> _media = [];

  @override
  Widget build(BuildContext context) {
    final tiles = _media.map((pair){
        return ListTile(
         child:  MediaListItem(media: _media[index]),
        );
      }
    );
    /*
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

    */
    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"), 
      ),
      body: ListView(children: divided),
    );
  }
}
*/

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return const Text("favorites");
  }
}