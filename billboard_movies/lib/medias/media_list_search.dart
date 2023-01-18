import 'package:flutter/material.dart';
import 'package:billboard_movies/media/media_movie.dart';

class MediaListSearch extends StatelessWidget {
  const MediaListSearch ({super.key, required this.media});
  final Media media;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child:Stack(
            children: <Widget>[
              Image.network (
                media.getBackDropUrl(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900]?.withOpacity(0.5),
                  ),
                  constraints: const  BoxConstraints.expand(
                    height: 55.0
                  ),
                ),          
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(media.title, 
                    style: const TextStyle(fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(media.getGenres(), 
                        style: const TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                    ),
                  )],
                ),
              ),     
            ],
          ),
        ),
      ]
    );
  }
}