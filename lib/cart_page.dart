import 'package:flutter/material.dart';
import 'package:lophocphan/pay_page.dart';
import 'package:lophocphan/productlist_page.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Cart"),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductListPage()));
                  },
                  style: styleButton,
                  child: Container(
                      height: 36,
                      child: Row(
                        children: [
                          Icon(Icons.home,color: clr,),
                        ],
                      ))
              ),
            ],
          ),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        ),
        body:
        Column(
          children: [
            Container(
              height: 60,
              child: Row(
                children: [
                  Container(
                    width: 330,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: TextFormField(
                        controller: searchControler,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: Colors.orange),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            label: Text("Tìm kiếm",style:
                            TextStyle(
                                color: clr,
                                fontSize: 15
                            ),
                            ),
                            hintText: "Tìm kiếm",
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            prefixIcon: Icon(Icons.search)
                        ),
                        validator: (search){
                          if( search == null || search.isEmpty)
                            return "Từ khóa tìm kiếm rỗng";
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
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
                          if  (_formKey.currentState!.validate())
                          {
                            var searchWord = searchControler.text;
                            print("Kết quả của ${searchWord}");
                          }
                          else
                          {
                            print("Dữ liệu không chính xác");
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15),
                          child: Text("Search",style:
                          TextStyle(
                              fontSize: 16
                          ),
                          ),
                        )
                    ),
                  ),
                  Divider(
                    color: Colors.grey ,
                  ),
                  Container(
                    height: 36,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if (pp.showGrid == true)
                              pp.showGrid = false;
                            else
                              pp.showGrid = true;
                          });
                        },
                        style: styleButton,
                        child: Icon(pp.showGrid?Icons.list:Icons.grid_on,color: clr,)
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  if(pp.listCart.isEmpty)
                    Center(child: Column(
                      children: [
                        SizedBox(
                          height: 220,
                        ),
                        Icon(Icons.stop_screen_share_outlined,size: 72,color: Colors.grey,),
                        Text("Giỏ hàng trống",style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                        TextButton(
                          onPressed: (){
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ProductListPage()));
                          },
                          child: Text("Hãy mua thêm",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),),
                        ),
                      ],
                    )),
                  ...pp.listCart.map((e) {
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
                                      width: 270,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 48,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStatePropertyAll<Color>(clr)
                                                ),
                                                onPressed: (){
                                                  setState(() {
                                                    e.minusOne(pp.listCart);
                                                  });

                                                },
                                                child: Text("-",style: TextStyle(
                                                  fontSize: 20,
                                                  // fontWeight: FontWeight.bold
                                                ),)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15,right: 15),
                                            child: Text(e.count.toString(),style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                            ),),
                                          ),
                                          Container(
                                            width: 48,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStatePropertyAll<Color>(clr)
                                                ),
                                                onPressed: (){
                                                  setState(() {
                                                    e.addOne( );
                                                  });
                                                },
                                                child: Text("+",style: TextStyle(
                                                  fontSize: 20,
                                                  // fontWeight: FontWeight.bold
                                                ),)),
                                          ),
                                        ],
                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: Container(
                                        width: 106,
                                        child: Text( "\$ "+ ((e.price*e.count).toString()),maxLines: 1,overflow: TextOverflow.clip,style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 18
                                        ),),
                                      ),
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
            ),
            Container(
              margin: EdgeInsets.only(right: 5,left: 5),
              padding: EdgeInsets.only(top: 5,bottom: 5
              ),
              child: ElevatedButton(
                onPressed: (){

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PayPage()));
                  setState(() {

                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  primary: Colors.orange,
                  shape: StadiumBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money,size: 24,color: Colors.white,),
                    Text(
                      "  Thanh toán",style:
                    TextStyle(fontSize: 15,color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}

