

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class hocphan {
  String tenlop="",malop="";
  int sohocvien=0;
}

class homepage extends StatelessWidget {
  homepage({super.key});
  Container item(String anh,String tenlop,String malop,String sohocvien){
    return new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.only(bottom: 2.5,top: 2.5),
      child:
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Image.network(anh),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20,top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(tenlop,style:
                      TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      ),
                    ),
                    TextButton(
                        onPressed: (){

                        },
                        child:
                        PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            // popupmenu item 1
                            PopupMenuItem(
                              value: 1,
                              // row has two child icon and text.
                              child: Row(
                                children: [
                                  SizedBox(
                                    // sized box with width 10
                                    width: 10,
                                  ),
                                  Text("Th??m")
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                                child:
                                Row(
                                  children: [
                                    SizedBox(
                                      // sized box with width 10
                                      width: 10,
                                    ),
                                    Text("S???a"),
                                  ],
                                )
                            ),
                            PopupMenuItem(
                                value: 3,
                                child:
                                Row(
                                  children: [
                                    SizedBox(
                                      // sized box with width 10
                                      width: 10,
                                    ),
                                    Text("X??a"),
                                  ],
                                )
                            )
                            // popupmenu item 2

                          ],
                          offset: Offset(0, 35),
                          color: Colors.white,
                          elevation: 3,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 30,bottom: 30 ),
                        //   child: Text("...",style:
                        //   TextStyle(
                        //       fontSize: 25,
                        //       color: Colors.white
                        //   ),),
                        // )
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
                child:
                Text(malop,style:
                TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 10),
                child: Text(sohocvien + " h???c vi??n",style:
                TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),),
              )
            ],
          )
        ],
      ),
    );
  }
  List<String> src=['assets/images/pic1.png', 'assets/images/pic2.png', 'assets/images/pic3.png', 'assets/images/pic4.png',];
  List<String> tenlop=['[2021-2022.2] Ph???n m???m m?? \nngu???n m??? - Nh??m 4', '[2021-2022.2] Java n??ng cao \n- Nh??m 12', '[2021-2022.2] L???p tr??nh Front\n-end - Nh??m 7', '[2021-2022.2] K??? thu???t l???p \ntr??nh - Nh??m 2',];
  List<String> malop=['2021-2022.1TIN34.004', '2021-2022.1TIN92.012', '2021-2022.1TIN27.007', '2021-2022.1TIN21.002',];
  List<String> sohocvien=['12', '36', '42', '31'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title:
          Text("Classroom - THU???N"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        ),
        body:
        SingleChildScrollView(
          child:
          Column(
            children: [
              for(int i=0;i<4;i++)
                item(src[i], tenlop[i], malop[i], sohocvien[i]),
            ],
          ),
        )
    );
  }
}