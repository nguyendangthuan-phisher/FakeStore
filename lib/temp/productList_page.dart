import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lophocphan/temp/product_provider/product_provider.dart';
import 'package:provider/provider.dart';

class productList_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return productList_page_state();
  }
}

class productList_page_state extends State<productList_page> {
  // const productList_page({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<produc_provider>(context);

    if (productProvider.list.isEmpty) {
      productProvider.getList();
    }
    // productProvider.checkProduct();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black12),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                   IconButton(
                              onPressed: () {
                                setState(() {
                                  if (productProvider.showGrid == true) {
                                    print("true");
                                    productProvider.showGrid = false;
                                  } else {
                                    print("false");
                                    productProvider.showGrid = true;
                                  }
                                });
                              },
                              icon: productProvider.showGrid?Icon(Icons.grid_on):Icon(Icons.list)),
                  ...productProvider.list2.map((e){
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: (){
                            setState((){
                              productProvider.categlory = e.toString();
                              productProvider.checkProduct();
                             
                            });
                          }, child: Text(e)),
                        )
                      );
                  }).toList()
                ],
                
              ),
              Expanded(
                //width: 500,
                child: (productProvider.showGrid)
                    ? GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: (250 / 300),
                        children: [
                         
                          ...productProvider.list.map((e) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Center(
                                            child: Image.network(e.image.toString(),
                                                height: 160)),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.title ?? "",
                                                style: (TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$" + e.price.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color:
                                                  Color.fromARGB(255, 238, 77, 45)),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Color.fromARGB(
                                                    255, 238, 77, 45)),
                                            Icon(Icons.star,
                                                color: Color.fromARGB(
                                                    255, 238, 77, 45)),
                                            Icon(Icons.star,
                                                color: Color.fromARGB(
                                                    255, 238, 77, 45)),
                                            Icon(Icons.star,
                                                color: Color.fromARGB(
                                                    255, 238, 77, 45)),
                                            Icon(Icons.star_half,
                                                color: Color.fromARGB(
                                                    255, 238, 77, 45)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList()
                        ],
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              
                              ...productProvider.list.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.network(e.image.toString(), width: 65),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          width: 350,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.title.toString(),
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 4.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$" + e.price.toString(),
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255, 238, 77, 45)),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: const [
                                                        Icon(Icons.star,
                                                            color: Color.fromARGB(
                                                                255, 238, 77, 45),
                                                            size: 16),
                                                        Icon(Icons.star,
                                                            color: Color.fromARGB(
                                                                255, 238, 77, 45),
                                                            size: 16),
                                                        Icon(Icons.star,
                                                            color: Color.fromARGB(
                                                                255, 238, 77, 45),
                                                            size: 16),
                                                        Icon(Icons.star,
                                                            color: Color.fromARGB(
                                                                255, 238, 77, 45),
                                                            size: 16),
                                                        Icon(Icons.star_half,
                                                            color: Color.fromARGB(
                                                                255, 238, 77, 45),
                                                            size: 16),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                e.description.toString(),
                                                style: TextStyle(fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }).toList()
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
