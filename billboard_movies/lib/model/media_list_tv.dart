import 'package:flutter/material.dart';
import 'package:billboard_movies/model/media.dart';

class MediaListTv extends StatelessWidget {
  const MediaListTv({super.key, required this.media});
  final Media1 media;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child:Stack(
            children: <Widget>[
              Image.network (
                media.getPosterUrl(),
                fit: BoxFit.cover,
                width: 130,
                height: 205,
              ),
            ],
          ),
        ),
      ]
    );
  }
}

