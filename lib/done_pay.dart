import 'package:flutter/material.dart';
import 'package:lophocphan/productlist_page.dart';

class DonePayPage extends StatelessWidget {
  DonePayPage({Key? key}) : super(key: key);
  ButtonStyle styleButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
  );
  TextStyle style = TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(231, 53, 35, 1),
      fontWeight: FontWeight.bold
  );
  Color clr = Colors.orange;
  Color clrscr = Color.fromRGBO(231, 53, 35, 1);
  var searchControler = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Thanh toán"),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductListPage()));
                },
                style: styleButton,
                child: Container(
                    height: 36,
                    child: Row(
                      children: [
                        Icon(Icons.home,color: clr,),
                      ],
                    ))
            ),
          ],
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.done,color: Colors.green,size: 144,),
            Text("Thanh toán thành công",style: TextStyle(
              fontSize: 28,
              color: Colors.black
            ),),
          ],
        ),
      ),
    );
  }
}
