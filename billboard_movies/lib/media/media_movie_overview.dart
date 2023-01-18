import 'package:flutter/material.dart';
import 'package:billboard_movies/media/media_movie.dart';

/*
class Build extends StatefulWidget {
  const Build({super.key, required this.media});
  final Media media;

  @override
  State<Build> createState() => _BuildState();
}

class _BuildState extends State<Build>{
  final saved = <Media>{};

  @override
  Widget build(BuildContext context) {
    final bool alreadySaved = saved.contains(media);
    return ListTile( 
    trailing: Icon(
      alreadySaved ? 
      Icons.favorite: Icons.favorite_border, color: Colors.white,size: 35,),  
    
    onTap: () {
      setState(() {
        if(alreadySaved){
          saved.remove(media);
        }else{
          saved.add(media);   
        }       
      });
    });  
  }
}*/

class MediaOverview extends StatelessWidget {
  const MediaOverview({super.key, required this.media});
  final Media media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Billboard Movies"),
    ), 
    backgroundColor: Theme.of(context).colorScheme.primary,
    body: Column(
        children: <Widget>[
          ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.4,
                child:Image.network(
                  media.getBackDropUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 110),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.redAccent,
                            spreadRadius: 1,
                            blurRadius: 8 
                          )
                        ],                       
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          media.getPosterUrl(),
                          fit: BoxFit.cover,
                          height: 250,
                          width: 180,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(left:100, top: 75),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.deepOrange,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10 
                            )
                          ],                       
                        ),
                        child: const  Icon(Icons.play_arrow,
                            size: 60, 
                            color: Colors.white),                       
                      ),
                      onTap: () {
                        var router = MaterialPageRoute(
                        builder: (context) => Image.network(media.getBackDropUrl()));
                        Navigator.of(context).push(router);
                      },
                    ), 
                  ], 
                ), 
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(left: 30, top: 390),
                //margin: const EdgeInsets.only(left: 150, top: 390),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff292b37),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff292b37).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4 
                    )
                  ],                       
                ),
                child: const Icon(Icons.favorite_border, color: Colors.white, size: 35),  
              ), 
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(left: 150, top: 390),
                      //margin: const EdgeInsets.only(left: 270, top: 390),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff292b37),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff292b37).withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4 
                          )
                        ],                       
                      ),
                      child: const Icon(Icons.download, color: Colors.white, size: 35),  
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(left: 270, top: 390),
                      //margin: const EdgeInsets.only(left: 390, top: 390),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff292b37),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff292b37).withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4 
                          )
                        ],                       
                      ),
                      child: const Icon(Icons.share, color: Colors.white, size: 35),  
                    ),  
            ]
            )     
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(media.title, 
                        style: const TextStyle(
                          fontWeight: FontWeight.
                          bold, fontSize: 30,
                          color: Colors.white
                      )
                    ),
                  )
                ]
              ),
              Row(
                children: [
                  const Text("\n"),
                  const Text("   Genres: ", style: TextStyle(color: Colors.white60)),
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
                  const Text("   Date: ", style: TextStyle(color: Colors.white60)),
                  Text(media.releaseDate, 
                    style: const TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  const Text("\n   "),
                  const Icon(Icons.star, color: Colors.yellow, size: 20),
                  Text(" ${media.voteAvarge}",  
                    style: const TextStyle(color: Colors.white))
                ],
              ),
            ],
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
      )
    );
  }
}