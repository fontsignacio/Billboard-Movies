import 'package:billboard_movies/pages/category.dart';
import 'package:billboard_movies/pages/favorites.dart';
import 'package:billboard_movies/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:billboard_movies/pages/HomePage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeMovieState();
}

class _HomeMovieState extends State<Home> with SingleTickerProviderStateMixin{
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
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications, size: 25 ,)
          ),
          Padding(      
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton <MenuItem> (
            iconSize: 40,
            icon: CircleAvatar(
              radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7), 
              child: Image.network(
                fit: BoxFit.cover,
                "https://i.seadn.io/gae/b91FFh2EPsExNTHHqECbEQsqDSgaBeOxYWIZfNeYdXfmBOIFPpbyB2VphB_6m_g5iu_ACtgA11X-64TsqWUtdv5x9fFzco4N7OzFYio?auto=format&w=1000",
              ),
            ),
          ),
              color: const Color(0xff0f111d),
              itemBuilder: (context) =>  [
                PopupMenuItem(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),                          
                        child: CircleAvatar(  
                        radius: 60,                
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100), 
                          child: Image.network(
                            "https://i.seadn.io/gae/b91FFh2EPsExNTHHqECbEQsqDSgaBeOxYWIZfNeYdXfmBOIFPpbyB2VphB_6m_g5iu_ACtgA11X-64TsqWUtdv5x9fFzco4N7OzFYio?auto=format&w=1000",
                          ),
                        ),
                      ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 140),
                        child: Text("fontsignacio", 
                          style: TextStyle(
                            color: Colors.white
                          )
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 160),
                        child: Text("View profile",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white54
                          )
                        )
                      )
                    ],
                  )
                ),
                const PopupMenuItem(
                  child: Text("Edit Profile",
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),
                const PopupMenuItem(
                  child: Text("Settings",
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),
                const PopupMenuItem(
                  child: Text("Logout",
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ]  
            )
          )
        ],
      ),


      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          HomePage(),
          Search(),
          Favorites(),
        ],
      ),

      drawer: Drawer(
        backgroundColor: const Color(0xff0f111d),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 ), 
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                    blurRadius: 8 
                  )
                ],
                image: const DecorationImage(           
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3oVyZG_nC0IDmkAl_dggPmK64ye3piV7HPrA1MZC6lX3UQ0Ui6-aMloFGljFXk1bcByg&usqp=CAU'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Text(''),
            ),
            ListTile(
              trailing: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => const Home());
                Navigator.of(context).push(router);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.category, color: Colors.white),
              title: const Text('Category', style: TextStyle(color: Colors.white)),
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => const Category());
                Navigator.of(context).push(router);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.feedback, color: Colors.white),
              title: const Text('Send feedback', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              trailing: const Icon(Icons.help, color: Colors.white),
              title: const Text('Help', style: TextStyle(color: Colors.white)),
              onTap: () {},
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