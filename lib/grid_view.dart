import 'package:flutter/material.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';

class GridViewPage extends StatelessWidget {
  GridViewPage({Key? key}) : super(key: key);
  TextStyle style = TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(231, 53, 35, 1),
      fontWeight: FontWeight.bold
  );
  Color clr = Colors.orange;
  Color clrscr = Color.fromRGBO(231, 53, 35, 1);
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty)
      pp.getList();
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      scrollDirection: Axis.vertical,
      children: [

        ...pp.list.map((e) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.orange),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Container(
                    height: 36,
                    child: Image.network(e.image.toString())
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 45,
                    child: Text(e.title??"",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                    ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text( "\$ "+ (e.price.toString()),style: style,),
                    Container(
                      width: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(clr)
                          ),
                          onPressed: (){},
                          child: Icon(Icons.shopping_cart,size: 16,)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          );
          // return Text(e.title??"");
        })
      ],
    );
  }
}
