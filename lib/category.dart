import 'package:flutter/material.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);
  List<String> hashList = [
    'Men\'s Clothing', 'Jewelery', 'Electronics', 'Sweater', 'Jacket', 'Hat',
  ];
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.listCategory.isEmpty)
      pp.getCateglory();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...pp.listCategory.map((e) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5)
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
