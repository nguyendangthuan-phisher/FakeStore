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
  Color clr = Colors.orange;
  Column rateDraw(double rate,num count){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for(int i=0;i<rate.toInt();i++)
              Icon(Icons.star,color: Colors.orange,size: 16,),
          ],
        ),
        Row(
          children: [
            Text(rate.toString(),style: TextStyle(
              color: Colors.black,
              fontSize: 12
            ),),
            Icon(Icons.star,color: Colors.orange,size: 12,),
            Text("  \("+ count.toString() + "\)",style: TextStyle(
                color: Colors.black,
                fontSize: 12
            ),)
          ],
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty)
      pp.getList();
    return Scaffold(
        body:
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...pp.list.map((e) {
              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.orange, //                   <--- border color
                      width: 2.0,
                    ),
                  ),
                  height: 100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 20),
                        child: Container(
                            width: 50,
                            child: Image.network(e.image.toString())
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 260,
                                height: 48,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 4),
                                  child: Text(e.title??" ",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: rateDraw(e.rate??0.toDouble(),e.rateCount??0),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 250,
                                child: Text(e.description??"",maxLines: 2,style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey
                                ),),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Text( "\$ "+ (e.price.toString()),style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red
                                    ),),
                                  ),
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
                            ],
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              );
            })
          ],
        ),
    );
  }
}

