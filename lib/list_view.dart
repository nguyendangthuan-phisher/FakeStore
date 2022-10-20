import 'package:flutter/material.dart';
import 'package:lophocphan/productlist_page.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';
class ListViewerPage extends StatelessWidget {
  ListViewerPage({Key? key}) : super(key: key);
  TextStyle style = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  ButtonStyle styleButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
  );
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty)
      pp.getList();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          title:
          Row(
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListViewerPage()));
                  },
                  style: styleButton,
                  child: Row(
                    children: [
                      Icon(Icons.list),
                    ],
                  )
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductListPage()));
                  },
                  style: styleButton,
                  child: Row(
                    children: [
                      Icon(Icons.grid_on),
                    ],
                  )
              ),
              Text("JSON View"),
              Text("")
            ],
          ),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        ),
        body:
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...pp.list.map((e) {
              return Text(e.category??"");
            })
          ],
        ),
    );
  }
}

