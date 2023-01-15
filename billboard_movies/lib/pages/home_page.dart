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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Popular(),
          Padding(
            padding: EdgeInsets.only(top:260),
            child:Coming(),
          ),
          Padding(
            padding: EdgeInsets.only(top:520),
            child: Top(),
          )
        ]
      ),
    );
  }
}