import 'package:billboard_movies/pages/popular_page.dart';
import 'package:billboard_movies/pages/coming_page.dart';
import 'package:billboard_movies/pages/top_page.dart';
import 'package:flutter/material.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const[
          Popular(),
          Padding(
            padding: EdgeInsets.only(top:260),
            child:Coming(),
          ),
          Padding(
            padding: EdgeInsets.only(top:520),
            child: Top(),
          )
        ], 
      ), 
    );
  }
}
