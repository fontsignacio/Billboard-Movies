import 'package:billboard_movies/pages/latest_tv.dart';
import 'package:billboard_movies/pages/pupular_tv.dart';
import 'package:billboard_movies/pages/top_tv.dart';
import 'package:flutter/material.dart';
import 'package:billboard_movies/home_movie.dart';

class HomeTv extends StatefulWidget {
  const HomeTv({super.key});

  @override
  State<HomeTv> createState() => _HomeTvState();
}

class _HomeTvState extends State<HomeTv> with SingleTickerProviderStateMixin{
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
          PopularTv(), 
          Latest(),
          TopTv()
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3oVyZG_nC0IDmkAl_dggPmK64ye3piV7HPrA1MZC6lX3UQ0Ui6-aMloFGljFXk1bcByg&usqp=CAU'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(''),
            ),
            ListTile(
              trailing: const Icon(Icons.local_movies),
              title: const Text('Movies'),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => const HomeMovie());
                Navigator.of(context).push(router);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.live_tv),
              title: const Text('TV'),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => const HomeTv());
                Navigator.of(context).push(router);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.close),
              title: const Text('Close'),
              onTap: () => Navigator.of(context).pop(),
            )],
          ),
        ),

        bottomNavigationBar: Material(
        child:  TabBar(
          controller: controller,
          tabs: const <Tab>[
            Tab(
              icon: Icon(Icons.thumb_up),
              text: "Popular"
            ),
            Tab(
              icon: Icon(Icons.update),
              text: "Latest"
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Top Tv"
            )
          ],
        ),
      ),
    );
  }
}