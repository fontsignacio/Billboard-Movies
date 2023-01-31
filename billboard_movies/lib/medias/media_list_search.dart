import 'package:flutter/material.dart';
import 'package:billboard_movies/medias/media_movie.dart';

class MediaListSearch extends StatelessWidget {
  const MediaListSearch ({super.key, required this.media});
  final Media media;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white38,
                spreadRadius: 1,
                blurRadius: 4
              )
            ],                       
          ),
          child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Card(
            shadowColor: Colors.white,
            color: const  Color(0xff292b37),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[  
                Image.network (
                  media.getPosterUrl(),
                  fit: BoxFit.cover,
                  height: 250,
                  width: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 250,
                          child: Text(media.title, 
                            style: const TextStyle(fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white
                          )
                        ),
                      ),
                      Container(
                        width: 250,
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(media.getGenres(), 
                            style: const TextStyle(color: Colors.white54),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(media.releaseDate, 
                            style: const TextStyle(color: Colors.white54),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow, size: 20),
                            Text(" ${media.voteAvarge}",  
                              style: const TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                    ],
                  ),
                ),      
              ],
            ),
          ),     
        ),
        )      
      ]
    );
  }
}