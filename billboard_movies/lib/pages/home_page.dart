import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:billboard_movies/pages/coming_page.dart';
import 'package:billboard_movies/pages/popular_page.dart';
import 'package:billboard_movies/pages/top_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controllerOne = ScrollController();
  final List<Widget> pages = [const Popular(),const Coming(), const Top()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Popular(),
          Padding(
            padding: EdgeInsets.only(top:300),
            child:Coming(),
          ),
          Padding(
            padding: EdgeInsets.only(top:600),
            child: Top(),
          )
        ]
      ),
    );
  }
}

          
    
    /*
    //final _verticalScrollController  = ScrollController();
    //final _horizontalScrollController = ScrollController();


    return AdaptiveScrollbar(
          underColor: Colors.blueGrey.withOpacity(0.3),
          sliderDefaultColor: Colors.grey.withOpacity(0.7),
          sliderActiveColor: Colors.grey,
          controller: _verticalScrollController,
          child: AdaptiveScrollbar(
            controller: _horizontalScrollController,
            position: ScrollbarPosition.bottom,
            underColor: Colors.blueGrey.withOpacity(0.3),
            sliderDefaultColor: Colors.grey.withOpacity(0.7),
            sliderActiveColor: Colors.grey,
            child: SingleChildScrollView(
              controller: _verticalScrollController,
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
            child: Scaffold(
            body: Stack(  
              children: const [
                Popular(),
                Padding(
                  padding: EdgeInsets.only(top:300),
                  child:Coming(),
                ),
                Padding(
                  padding: EdgeInsets.only(top:600),
                  child: Top(),
                )
              ],
            )
          )
        )
      )
    ));*/
