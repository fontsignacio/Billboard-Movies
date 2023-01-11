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
          Stack(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: "assets/placeholder.jpg",
                image: media.getBackDropUrl(),
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
              Positioned(
                  left: 390.0,
                  bottom: 10.0,
                  child: Row(
                    children: [
                      Text("${media.releaseDate} ", 
                      style: const TextStyle(color: Colors.white)),
                      const Icon(Icons.calendar_month, size: 17)
                  ],
                )
              ),
              Positioned(
                left: 436.0,
                bottom: 21.0,
                child: Row(
                  children: [
                    const Text("\n"),
                    const Icon(Icons.star, color: Colors.yellow, size: 20),
                    Text(" ${media.voteAvarge}",  
                      style: const TextStyle(color: Colors.white))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
