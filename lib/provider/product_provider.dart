import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lophocphan/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  List<ProductModel> list = [];
  List<ProductModel> listTemp = [];
  List<ProductModel> listCart = [];
  List<String> listCategory = [];
  String category = "none";
  List<ProductModel> listCategorySelected = [];
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
    listTemp = jsonObject.map((e) {
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
  void checkProduct(String c) async {
    this.category=c;
    for(int i=0;i<list.length;i++){
      if(list[i].category!= category){
        list.removeAt(i);
        i--;
      }
    }
  }

  List<ProductModel> selectedCategory(String category)
  {
    List<ProductModel> l = [];
    for(int i=0;i<listTemp.length;i++){
      if(listTemp[i].category==category)
        l.add(list[i]);
    }
    return l;
  }

}