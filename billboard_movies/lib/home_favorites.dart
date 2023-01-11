import 'package:flutter/material.dart';
/*
class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final _saved = <Media>{};

  @override
  Widget build(BuildContext context) {
    final tiles = _saved.map((pair){
        return ListTile(
         child:  MediaListItem(media: _media[index]),
        );
      }
    );

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"), 
      ),
    );
  }
}