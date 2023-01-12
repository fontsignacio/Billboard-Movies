import 'package:flutter/material.dart';
import 'package:billboard_movies/model/media.dart';

class MediaListTv extends StatelessWidget {
  const MediaListTv({super.key, required this.media});
  final Media1 media;

  @override
  Widget build(BuildContext context) {
    return Card( 
    child: Column(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:Stack(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: "assets/images/placeholder.jpg",
                image: media.getBackDropUrl(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              const Positioned(
                left: 450,
                bottom: 260,
                child: Icon(Icons.favorite_border,
                 size: 35,
                 color: Colors.white)
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
                    Text(media.name, 
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
              /*Positioned(
                  left: 390.0,
                  bottom: 10.0,
                  child: Row(
                    children: [
                      Text("${media.firstDate} ", 
                      style: const TextStyle(color: Colors.white)),
                      const Icon(Icons.calendar_month, size: 17)
                  ],
                )
              ),*/
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
          ),
        ),
      ]
    ));
  }
}

