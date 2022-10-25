
import 'package:flutter/material.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp2> {
  List<String> _products = ['Laptop'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('First app')),
        body: Column(children: [
          Container(
              margin: EdgeInsets.all(10.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _products.add('PC');
                    });
                  },
                   icon:const Icon(Icons.more_horiz, color: Colors.white,)),
                ),
          Column(
              children: _products
                  .map((element) => Card(
                        child: Column(
                          children: <Widget>[
                            Text(element)
                          ],
                        ),
                      ))
                  .toList()),
        ]),
      ),
    );
  }
}