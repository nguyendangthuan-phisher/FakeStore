import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lophocphan/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  List<ProductModel> list = [];
  List<ProductModel> listCart = [];
  List<String> listCategory = [];
  ProductModel detail = new ProductModel();
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
    this.getCateglory();
  }

  void getCateglory() async {
    list.map((e) {
      if (!listCategory.contains(e.category.toString())) {
        listCategory.add(e.category.toString());
      }
    }).toList();

  }

  void addToCart(int id, String? title, double price, String? description, String? category, String? image,  double? rate, int  rateCount)
  {
    bool check=false;
    for(int i=0;i<listCart.length;i++)
      if(listCart[i].id==id)
      {
        listCart[i].addOne();
        check=true;
        return ;
      }

    ProductModel p =new ProductModel(id: id,title: title,description: description,category: category,image: image,price: price,rate: rate,rateCount: rateCount);
    listCart.add(p);
  }

  double totalPrice()
  {
    double ans = 0.0;
    for(int i=0;i<listCart.length;i++)
      {
        ans+=(listCart[i].price * listCart[i].count);
      }
      return ans;
  }


}