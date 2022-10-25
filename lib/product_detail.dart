import 'package:flutter/material.dart';
import 'package:lophocphan/productlist_page.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key,required String name}) : super(key: key);
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: clr,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Product Detail"),
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
          ],
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10), // Image border
            //   child: SizedBox.fromSize(
            //     size: Size.fromRadius(90), // Image radius
            //     child: Image.network('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', fit: BoxFit.cover),
            //   ),
            // ),
            Container(
                width: 200,
                child: Image.network('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg')),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Jallraven - Foldsack No. 1 Backpack, Fits 15\" Laptops",maxLines: 3,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("\$" + "109.95",style: TextStyle(
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
                          //
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
    );
  }
}

