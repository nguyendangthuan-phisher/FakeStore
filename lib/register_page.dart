import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  var phoneControler = TextEditingController();
  var userNameControler = TextEditingController();
  var passWordControler = TextEditingController();
  var rePassWordControler = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String? p1,p2;
  String src = 'assets/images/LOGOevn.jpeg';
  Color clrsrc = Colors.deepOrangeAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrsrc,
        title:
        Text("Đăng ký tài khoản"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.network(src,width: 130,),
              //input phoneNumber
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: phoneControler,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: Text("Số điện thoại",style:
                      TextStyle(
                          color: clrsrc,
                          fontSize: 14
                      ),
                      ),
                      hintText: "Nhập số điện thoại",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: Icon(Icons.call)
                  ),
                  validator: (Phonestr){
                    if( Phonestr == null || Phonestr.isEmpty)
                      return "Số điện thoại không được rỗng";
                    else
                      {
                        if(Phonestr.length!=10)
                          return "Số điện thoại phải có 10 chữ số";
                      }
                    return null;
                  },
                ),
              ),
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
                  validator: (passWord){
                    // lưu lại để kiểm tra nhập lại mật khẩu
                    p1=passWord;
                    if( passWord == null || passWord.isEmpty)
                      return "Mật khẩu rỗng";
                    return null;
                  },
                ),
              ),
              //input rePassWord
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: rePassWordControler,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: Text("Nhập lại mật khẩu",style:
                      TextStyle(
                          color: clrsrc,
                          fontSize: 14
                      ),
                      ),
                      hintText: "Vui lòng lại nhập mật khẩu",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: Icon(Icons.key)
                  ),
                  validator: (rePassword){
                    p2=rePassword;
                    if( rePassword == null || rePassword.isEmpty)
                      return "Mật khẩu nhập lại rỗng";
                    else if(p2!=p1)
                      return "Mật khẩu không khớp";
                    else
                      return null;
                  },
                ),
              ),
              // nút đăng ký
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
                      padding: const EdgeInsets.only(left: 160,right: 160,top: 15,bottom: 15),
                      child: Text("Đăng ký tài khoản",style:
                      TextStyle(
                          fontSize: 16
                      ),),
                    )
                ),
              ),
              //nút tiến tới
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // cách vào nút quay lại 1 khoảng trống
                  SizedBox(width: 20,),
                  Text("Đã có tài khoản?,",style:
                  TextStyle(
                    color: Colors.grey
                  ),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Đăng nhập",style:
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
