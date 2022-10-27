import 'package:flutter/material.dart';
import 'package:lophocphan/cart_page.dart';
import 'package:lophocphan/done_pay.dart';
import 'package:lophocphan/pay_page.dart';
import 'package:lophocphan/product_detail.dart';
import 'package:lophocphan/productlist_page.dart';
import 'package:lophocphan/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:lophocphan/homepage.dart';
import 'package:lophocphan/login_page.dart';
import 'package:lophocphan/register_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> ProductProvider())
    ],
    child: MaterialApp(
        home: ProductListPage(),
    ),
  ));
}
