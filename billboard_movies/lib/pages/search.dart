import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color:const Color(0xff292b37),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.search,
              color: Colors.white54,
              size: 30
            ),
            Container(
              width: 400,
              margin: const EdgeInsets.only(left: 5),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white54)
                ),
              ),
            )
          ],
        ),            
      ),
    );
  }
}