import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:http/http.dart' as http;

class produc_provider extends ChangeNotifier {
  List<ProductModel> list = [];
  List<String> list2 = [];
  String categlory = "none";
  bool showGrid = true;
  void show(bool isGrid) {
    showGrid = isGrid;
    notifyListeners();
  }

  void getList() async {
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(apiURL));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;
    list = jsonObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    this.getCateglory();
    notifyListeners();
  }

  void getCateglory() async {
    this.list.map((e) {
      if (!list2.contains(e.category.toString())) {
        list2.add(e.category.toString());
      }
    }).toList();
    
  }

  void checkProduct() async {
    if (categlory != "none") {
      for(int i=0;i<list.length;i++){
        if(list[i].category!=categlory){
          list.removeAt(i);
          i--;
        }
      }
    }
    print(categlory);
  }
}
