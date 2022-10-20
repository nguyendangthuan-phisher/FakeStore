import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);
  List<String> hashList = [
    'Men\'s Clothing', 'Jewelery', 'Electronics', 'Sweater', 'Jacket', 'Hat',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...hashList.map((e) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                e,style:
              TextStyle(fontSize: 15,color: Colors.white),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
