import 'package:flutter/material.dart';
import 'package:lophocphan/category.dart';
import 'package:lophocphan/grid_view.dart';
import 'package:lophocphan/list_view.dart';
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ProductListPage()));
                  },
                  style: styleButton,
                  child: Container(
                      height: 36,
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart,color: clr,),
                          Column(
                            children: [
                              Text(" \(" + "0" + "\)",style: TextStyle(
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
              child: pp.showGrid ? ListViewerPage() : GridViewPage(),
            )
          ],
        )
    );
  }
}

