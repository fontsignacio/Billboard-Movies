import 'package:billboard_movies/pages/favorites.dart';
import 'package:billboard_movies/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:billboard_movies/pages/home_page.dart';

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
      ),

      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          HomePage(),
          User(),
          Favorites(),
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
                /*var router = MaterialPageRoute(
                builder: (context) => const HomeTv());
                Navigator.of(context).push(router);*/
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        ),
        color: const Color(0xff292b37),
        child:  SizedBox(
          height: 65,
          child: TabBar(
            indicatorColor: Colors.white,
            controller: controller,
            tabs: const <Tab>[
              Tab(
                icon: Icon(Icons.home, size: 35),
              ),
              Tab(
                icon: Icon(Icons.search, size: 35),
              ),
              Tab(
                icon: Icon(Icons.favorite, size: 35),
              )
            ],
          ),
        ),
      )
    );
  }
}