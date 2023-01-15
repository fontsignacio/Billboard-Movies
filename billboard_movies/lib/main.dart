import 'package:flutter/material.dart';
import 'package:billboard_movies/home.dart';

void main(){
  runApp(MaterialApp( 
    title: "Billboard Movies",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xff0f111d),
      ),
      scaffoldBackgroundColor: const Color(0xff0f111d),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
      )
    ),
    home: const HomeMovie(),
  ));
}