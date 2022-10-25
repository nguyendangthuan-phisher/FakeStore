import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  HomePage({super.key});
  String src = "https://images.unsplash.com/photo-1519638399535-1b036603ac77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "this is my first application",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 30
          ),
        )
      ),
      body:  Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "xin chao",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red
                ),
              ),
              Text(
                "chao mung bro!"
                ),          
              Image.network(src),
              Image.asset("assets/images/anh1.jpg"),
              Image.network(src),
              Image.asset("assets/images/anh1.jpg"),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.yellow[400],
                  ),
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.yellow[400],
                  ),
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.yellow[400],
                  ),
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.yellow[400],
                  ),
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.brown[400],
                  ),
                  Text(
                    "over 2000 people ratings",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  
                  )
                ],
              )      
            ],
          ),
        ),
      ),
    );
  }
}