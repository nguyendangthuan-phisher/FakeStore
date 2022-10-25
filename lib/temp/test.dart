
import 'package:flutter/material.dart';

class SliderDestination extends StatelessWidget {
  SliderDestination({super.key});
  List<String> listImage = [
    'assets/images/hinh1.jpg',
    'assets/images/hinh2.jpg',
    'assets/images/hinh3.jpg',
    'assets/images/hinh4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 300,
          child: Row(
            children: [
              //cách 1:
              // Image.asset(listImage[0]),
              // Image.asset(listImage[1]),
              // Image.asset(listImage[2]),
              // Image.asset(listImage[3]),
              // Image.asset(listImage[4]),
              //cách 2:
              // ...listImage.map((e) {
              //   return Image.asset(e);
              // }).toList()
              //cách 3:
              // for (int i = 0; i < listImage.length; i++)
              //   Image.asset(listImage[i]),
              //cach4:
              ...listImage.map((e) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(e), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30)),
                );
              }).toList()
            ],
          ),
        ));
  }
}