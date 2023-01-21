import 'package:billboard_movies/models/category_page.dart';
import 'package:flutter/material.dart';
import 'package:billboard_movies/api/util.dart';


class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilboard Movies"),
      ),
      body: Stack(
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text("Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
            color: Colors.white )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 34),
          child: ListView.builder(
            padding: const EdgeInsets.all(30),
            itemCount: genre.length,
            itemBuilder:  (context, index) {
              return SizedBox(
                height: 60,
                child: GestureDetector(
                  child: Stack(
                    children: [
                      const Divider(height: 60, color: Colors.white,),
                      Padding(
                        padding: const  EdgeInsets.only(left: 10),
                        child: Text(genre[index], 
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ) 
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 415),
                        child: Icon(Icons.arrow_forward_ios_outlined, size: 20, color: Colors.white,),
                      )
                    ],
                  ),
                  onTap: () {
                    var router = MaterialPageRoute(
                    builder: (context) => CategoryPage(genre: genre[index].toString()));
                    Navigator.of(context).push(router);
                  }
                )
                );
              }
            ),
          )
        ]
      )
    );
  }
}