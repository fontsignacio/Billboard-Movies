import 'package:billboard_movies/home_favorites.dart';
import 'package:flutter/material.dart';
import 'package:billboard_movies/pages/popular_page.dart';
import 'package:billboard_movies/pages/coming_page.dart';
import 'package:billboard_movies/pages/top_page.dart';
import 'package:billboard_movies/home_tv.dart';

class HomeMovie extends StatefulWidget {
  const HomeMovie({super.key});

  @override
  State<HomeMovie> createState() => _HomeMovieState();
}

class _HomeMovieState extends State<HomeMovie> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState(){
    super.initState();
    controller =  TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Billboard Movies"),

        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search, color: Colors.white,),
              onPressed: () {
            },
          )
        ],
      ),

      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          Popular(), 
          Coming(),
          Top()
        ],
      ),

      drawer: Drawer(
        backgroundColor: const Color(0xff0f111d),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 8 
                )],
                image: DecorationImage(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3oVyZG_nC0IDmkAl_dggPmK64ye3piV7HPrA1MZC6lX3UQ0Ui6-aMloFGljFXk1bcByg&usqp=CAU'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(''),
            ),
            ListTile(
              trailing: const Icon(Icons.local_movies, color: Colors.white),
              title: const Text('Movies', style: TextStyle(color: Colors.white)),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => const HomeMovie());
                Navigator.of(context).push(router);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.live_tv, color: Colors.white),
              title: const Text('TV Shows', style: TextStyle(color: Colors.white)),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => const HomeTv());
                Navigator.of(context).push(router);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.favorite, color: Colors.white),
              title: const Text('Favorites', style: TextStyle(color: Colors.white)),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => const Favorites());
                Navigator.of(context).push(router);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.close, color: Colors.white),
              title: const Text('Close', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.of(context).pop(),
            )],
          ),
        ),

      bottomNavigationBar: Material(
        shadowColor: Colors.white,
        color: const Color(0xff292b37),
        child:  TabBar(
          indicatorColor: Colors.white,
          controller: controller,
          tabs: const <Tab>[
            Tab(
              icon: Icon(Icons.thumb_up),
              text: "Popular"
            ),
            Tab(
              icon: Icon(Icons.update),
              text: "Coming soon"
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Top Movies"
            )
          ],
        ),
      ),
    );
  }
}