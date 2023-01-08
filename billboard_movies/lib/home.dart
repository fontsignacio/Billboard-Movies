import 'package:billboard_movies/pages/popular_page.dart';
import 'package:flutter/material.dart';
import 'package:billboard_movies/pages/coming_page.dart';
import 'package:billboard_movies/pages/top_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
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
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(''),
            ),
            ListTile(
              trailing: const Icon(Icons.local_movies),
              title: const Text('Movies'),
              onTap: () {},
            ),
            ListTile(
              trailing: const Icon(Icons.live_tv),
              title: const Text('TV'),
              onTap: () {},
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