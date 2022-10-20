import 'package:flutter/material.dart';
import 'package:lophocphan/register_page.dart';

// https://fakestoreapi.com/products


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var userNameControler = TextEditingController();
  var passWordControler = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String src = 'assets/images/LOGOevn.jpeg';
  Color clrsrc = Colors.deepOrangeAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: clrsrc,
      title:
      Text("Đăng nhập hệ thống"),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
    ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.network(src,width: 230,),
              //input userName
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: userNameControler,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: Text("Tên đăng nhập",style:
                        TextStyle(
                            color: clrsrc,
                            fontSize: 14
                        ),
                      ),
                      hintText: "Vui lòng nhập tên đăng nhập",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: Icon(Icons.person)
                  ),
                  validator: (str){
                    if( str == null || str.isEmpty)
                      return "Tên đăng nhập không được rỗng";
                    return null;
                  },
                ),
              ),
              //input passWord
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: passWordControler,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: Text("Mật khẩu",style:
                      TextStyle(
                          color: clrsrc,
                          fontSize: 14
                      ),
                      ),
                      hintText: "Vui lòng nhập mật khẩu",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: Icon(Icons.key)
                  ),
                  validator: (password){
                    if( password == null || password.isEmpty)
                      return "Mật khẩu rỗng";
                    return null;
                  },
                ),
              ),
              // nút đăng nhập
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(clrsrc),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                side: BorderSide(color: clrsrc)
                            )
                        )
                    ),
                    onPressed: (){
                      if  (_formKey.currentState!.validate())
                        {
                          var userName = userNameControler.text;
                          print("Xin chào ${userName}");
                        }
                      else
                        {
                          print("Dữ liệu không chính xác");
                        }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 185,right: 185,top: 15,bottom: 15),
                      child: Text("Đăng nhập",style:
                        TextStyle(
                          fontSize: 16
                        ),),
                    )
                ),
              ),
              //nút quay lại
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // cách vào nút quay lại 1 khoảng trống
                  SizedBox(width: 20,),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                      child: Text("Đăng ký",style:
                        TextStyle(
                          color: clrsrc
                        ),)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
