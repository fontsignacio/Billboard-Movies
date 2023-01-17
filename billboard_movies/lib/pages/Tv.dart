import 'package:billboard_movies/pages/pupular_tv.dart';
import 'package:billboard_movies/pages/on_the_air.dart';
import 'package:billboard_movies/pages/top_tv.dart';
import 'package:flutter/material.dart';

class Tv extends StatefulWidget {
  const Tv({super.key});

  @override
  State<Tv> createState() => _MovieState();
}

class _MovieState extends State<Tv> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Billboard Movies"),
      ),
      body: Stack(
        children: const[
          PopularTv(),
          Padding(
            padding: EdgeInsets.only(top:260),
            child: OnTheAir(),
          ),
          Padding(
            padding: EdgeInsets.only(top:520),
            child: TopTv(),
          )
        ], 
      ), 
    );
  }
}
