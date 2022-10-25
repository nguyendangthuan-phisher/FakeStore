
import 'package:flutter/material.dart';

class HashTagDestination extends StatelessWidget {
  HashTagDestination({super.key});
  List<String> HashList = [
    'Đại nội',
    'Du lich',
    'Ẩm thực',
    'Kết nối',
    'Huế',
    'Sông Hương',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 100,
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
              ...HashList.map((e) {
                // return Container(
                //     margin: EdgeInsets.only(right: 10),
                //     width: MediaQuery.of(context).size.width,
                //     decoration:
                //         BoxDecoration(borderRadius: BorderRadius.circular(30)));
                return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      e,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ));
              }).toList()
            ],
          ),
        ));
  }
}