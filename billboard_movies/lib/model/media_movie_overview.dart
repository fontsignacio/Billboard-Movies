import 'package:flutter/material.dart';
import 'package:billboard_movies/model/media.dart';

class MediaOverview extends StatelessWidget {
  const MediaOverview ({super.key, required this.media});
  final Media media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Billboard Movies"),
    ), 
    body: Card( 
      child: Column(
          children: <Widget>[
            ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: <Widget>[
                FadeInImage.assetNetwork(
                    placeholder: "assets/placeholder.jpg",
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
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(media.title, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,
                        color: Colors.white
                        )
                      ),
                    ],
                  ),
                ), 
              ])     
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("\n"),
                      const Text("Genres: ", style: TextStyle(color: Colors.white60)),
                      Text(media.getGenres(), 
                            style: const TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("\n"),
                      const Text("Date: ", style: TextStyle(color: Colors.white60)),
                      Text(media.releaseDate, 
                        style: const TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    children: [
                      const Text("\n"),
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      Text(" ${media.voteAvarge}",  
                        style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              )
            ),
            Card(
              color: const Color.fromARGB(255, 52, 51, 51),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("\n${media.overview}\n", 
                  style: const TextStyle(color: Colors.white, fontSize: 17)
              ) 
              )
            ),     
          ],
        ),
      )
    );
  }
}
