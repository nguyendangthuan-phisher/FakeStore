import 'package:flutter/material.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
              margin: EdgeInsets.only(right: 5,left: 5),
              padding: EdgeInsets.only(top: 5,bottom: 5
              ),
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    // pp.selectedCategory(e);
                    // pp.list=pp.listCategorySelected;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  primary: Colors.orange,
                  shape: StadiumBorder(),
                ),
                child: Text(
                  e,style:
                TextStyle(fontSize: 15,color: Colors.white),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}


