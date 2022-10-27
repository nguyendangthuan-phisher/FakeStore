import 'package:flutter/material.dart';
import 'package:lophocphan/model/product_model.dart';
import 'package:lophocphan/productlist_page.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ButtonStyle styleButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
  );
  TextStyle style = TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(231, 53, 35, 1),
      fontWeight: FontWeight.bold
  );
  Color clr = Colors.orange;
  Color clrscr = Color.fromRGBO(231, 53, 35, 1);
  var searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    ProductModel temp=pp.detail;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: clr,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Product Detail"),
            SizedBox(width: 50,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductListPage()));
                },
                style: styleButton,
                child: Container(
                    height: 36,
                    child: Icon(Icons.home,color: clr,))
            ),
            SizedBox(width: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                style: styleButton,
                child: Container(
                    height: 36,
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart,color: clr,),
                        Column(
                          children: [
                            Text(" \(" + (pp.listCart.length??0).toString() + "\)",style: TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        )
                      ],
                    ))
            ),
          ],
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 320,
                  width: 300,
                  child: Image.network(temp.image??"")),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(pp.detail.title??"",maxLines: 3,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(temp.description??""),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("\$" + (pp.detail.price??0).toString(),style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 36
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 170,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(clr),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                      side: BorderSide(color: clr)
                                  )
                              )
                          ),
                          onPressed: (){
                            setState(() {
                              pp.addToCart(temp.id, temp.title, temp.price, temp.description, temp.category, temp.image, temp.rate, temp.rateCount);
                            });

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5,top: 15,bottom: 15),
                            child: Row(
                              children: [
                                Icon(Icons.shopping_cart),
                                SizedBox(width: 20,),
                                Text("Add to cart",style:
                                TextStyle(
                                    fontSize: 16
                                ),),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}




