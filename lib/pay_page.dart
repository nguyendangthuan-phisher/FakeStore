import 'package:flutter/material.dart';
import 'package:lophocphan/done_pay.dart';
import 'package:lophocphan/productlist_page.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class PayPage extends StatelessWidget {
  PayPage({Key? key}) : super(key: key);
  ButtonStyle styleButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
  );
  List<String> payment_images = [
    'https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/PayPal_logo.svg/1200px-PayPal_logo.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png',
  ];
  List<String> payment_name = [
    'Momo',
    'Paypal',
    'VISA',
  ];
  TextStyle style = TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(231, 53, 35, 1),
      fontWeight: FontWeight.bold
  );
  Color clr = Colors.orange;
  Color clrscr = Color.fromRGBO(231, 53, 35, 1);
  var searchControler = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    // if (pp.listCart.isEmpty)
    //   pp.getCart();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: clr,
          title:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.attach_money),
              Text("Payment Page"),
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
                      width: 42,
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart,color: clr,),
                          Column(
                            children: [
                              Container(
                                width: 250,
                                child: Text(" \(" + (pp.listCart.length??0).toString() + "\)",maxLines: 1,overflow: TextOverflow.clip,style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ],
                          )
                        ],
                      ))
              ),
            ],
          ),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        ),
        body:
        Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text("\$ "+ pp.totalPrice().toString(),style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 42
              ),),
              SizedBox(height: 30,),
              for(int i=0;i<3;i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DonePayPage()));
                    },
                    style: ButtonStyle(
                      backgroundColor:  MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 120,
                                height: 120,
                                child: Image.network(payment_images[i])
                            ),
                            Text(payment_name[i],style: TextStyle(
                              fontSize: 36,
                              color: Colors.black
                            ),)
                          ],
                        )
                      ),
                  ),
                ),

            ],
          ),
        )
    );
  }
}

