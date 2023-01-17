import 'package:billboard_movies/common/http_handler_tv.dart';
import 'package:billboard_movies/model/media_list_tv.dart';
import 'package:billboard_movies/model/media_tv_overview.dart';
import 'package:flutter/material.dart';
import 'package:billboard_movies/model/media_tv.dart';

class OnTheAir extends StatefulWidget {
  const OnTheAir({super.key});

  @override
  State<OnTheAir> createState() => _OnTheAirState();
}

class _OnTheAirState extends State<OnTheAir> {
  final List<Media1> _media = [];
  final ScrollController _controllerOne = ScrollController();

  
  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  void loadMovies()async{
    var tv = await HttpHandlerTv().fetchTvOnTheAir();
    setState(() {
      _media.addAll(tv);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text("Tv On The Air",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
            color: Colors.white )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 34),
          child: SizedBox(
            height: 225,
            child: Scrollbar(
              thumbVisibility: true,
              controller: _controllerOne,
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                controller: _controllerOne,
                itemCount: _media.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
                itemBuilder:  (context, index) {
                  return GestureDetector(
                    child: MediaListTv(media: _media[index]),
                    onTap: () {
                        var router = MaterialPageRoute(
                        builder: (context) => MediaOverviewTv(media: _media[index]));
                        Navigator.of(context).push(router);
                      }
                    );
                  }
                ),
              )
            )  
          ),    
        ]
      )
    );
  }
}