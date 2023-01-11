import 'package:flutter/material.dart';
import 'package:billboard_movies/home_movie.dart';

void main(){
  runApp(MaterialApp( 
    debugShowCheckedModeBanner: false,
    home: const HomeMovie(),
    theme: ThemeData.dark(),
  ));
}