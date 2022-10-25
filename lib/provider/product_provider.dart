import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lophocphan/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  List<ProductModel> list = [];
  List<String> listCategory = [];
  bool showGrid = true;
  void show(bool isGrid){
    showGrid = isGrid;
    notifyListeners();
  }

  void getList() async{
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(apiURL));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;
    list = jsonObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    notifyListeners();
  }

  void getCateglory() async {
    list.map((e) {
      if (!listCategory.contains(e.category.toString())) {
        listCategory.add(e.category.toString());
      }
    }).toList();

  }
}