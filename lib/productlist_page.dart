import 'package:flutter/material.dart';
import 'package:lophocphan/cart_page.dart';
import 'package:lophocphan/category.dart';
import 'package:lophocphan/product_detail.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ProductListPageState();
  }
}

class _ProductListPageState extends State<ProductListPage> {
  Column rateDraw(double rate,num count){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for(int i=0;i<rate.toInt();i++)
              Icon(Icons.star,color: Colors.orange,size: 16,),
            if(rate%1>0.5)
              Icon(Icons.star_half,color: Colors.orange,size: 16,),
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
    if (pp.list.isEmpty)
      pp.getList();
    List<ProductProvider> cart;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: clr,
          title:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Fake Store API"),
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
            Category(),
            Expanded(
              child: !pp.showGrid
                  ? ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ...pp.list.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      child: TextButton(
                        onPressed: (){
                          pp.detail=e;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProductDetail()));
                        },
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
                                              fontWeight: FontWeight.bold,
                                            color: Colors.black
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
                                                onPressed: (){
                                                  setState(() {
                                                    pp.addToCart(e.id, e.title, e.price, e.description, e.category, e.image, e.rate, e.rateCount);
                                                  });
                                                },
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
                      ),
                    );
                  })
                ],
              )
                  : GridView.count(
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
                      child: TextButton(
                        onPressed: (){
                          pp.detail=e;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProductDetail()));
                        },
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
                                    fontSize: 14,
                                  color: Colors.black
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
                                      onPressed: (){
                                        setState(() {
                                          pp.addToCart(e.id, e.title, e.price, e.description, e.category, e.image, e.rate, e.rateCount);
                                        });
                                      },
                                      child: Icon(Icons.shopping_cart,size: 16,)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    );
                    // return Text(e.title??"");
                  })
                ],
              ),
            )
          ],
        )
    );
  }
}

