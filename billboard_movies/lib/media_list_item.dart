import 'package:flutter/material.dart';
import 'package:billboard_movies/model/media.dart';

class MediaListItem extends StatelessWidget {
  const MediaListItem({super.key, required this.media});
  final Media media;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: "assets/placeholder.jpg",
            image: media.getBackDropUrl(),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          )
        ],
      ),
    );
  }
}
