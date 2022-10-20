import 'package:flutter/material.dart';
import 'package:lophocphan/category.dart';
import 'package:lophocphan/list_view.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);
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
                    child: Icon(Icons.shopping_cart,color: clr,))
            ),
          ],
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
      ),
      body:
      // ListView(
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     ...pp.list.map((e) {
      //       return Text(e.title??"");
      //     })
      //   ],
      // ),
      Column(
        children: [
          Container(
            height: 60,
            child: Row(
              children: [
                Container(
                  width: 270,
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
                ),
                Container(
                  height: 36,
                  child: ElevatedButton(
                      onPressed: (){
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => ListViewerPage()));
                      },
                      style: styleButton,
                      child: Icon(Icons.list,color: clr,)
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: 36,
                  child: ElevatedButton(
                      onPressed: (){
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => ProductListPage()));
                      },
                      style: styleButton,
                      child: Icon(Icons.grid_on,color: clr,)
                  ),
                ),
              ],
            ),
          ),
          Category(),
          Expanded(
            child: GridView.count(
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
                        // Container(
                        //   height: 25,
                        //   width: 80,
                        //   child: ElevatedButton(
                        //       style: ButtonStyle(
                        //           backgroundColor: MaterialStatePropertyAll<Color>(clr)
                        //       ),
                        //       onPressed: (){},
                        //       child: Text("Add")),
                        // ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                  // return Text(e.title??"");
                })
              ],
            ),
          ),
        ],
      )
    );
  }
}
