import 'package:flutter/material.dart';
import 'package:billboard_movies/home.dart';

void main(){
  runApp(MaterialApp( 
    debugShowCheckedModeBanner: false,
    home: const Home(),
    theme: ThemeData.dark(),
  ));
}