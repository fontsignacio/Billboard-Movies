// ignore_for_file: file_names
import 'package:billboard_movies/model/popular_page.dart';
import 'package:billboard_movies/model/pupular_tv.dart';
import 'package:billboard_movies/model/on_the_air.dart';
import 'package:billboard_movies/model/top_tv.dart';
import 'package:billboard_movies/model/coming_page.dart';
import 'package:billboard_movies/model/top_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: [
          Stack(
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
            ],
          ),
          Stack(
            children: const [
              PopularTv(),
              Padding(
                padding: EdgeInsets.only(top:260),
                child:OnTheAir(),
              ),
              Padding(
                padding: EdgeInsets.only(top:520),
                child: TopTv(),
              )
            ],
          )
        ], 
      ), 
    );
  }
}
