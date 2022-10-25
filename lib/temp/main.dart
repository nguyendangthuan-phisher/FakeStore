import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/dest.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/productList_page.dart';
import 'package:flutter_application_1/product_provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> produc_provider())
      ],
      child: (MaterialApp(
        home: productList_page(),
      )),
    )
  );
}
