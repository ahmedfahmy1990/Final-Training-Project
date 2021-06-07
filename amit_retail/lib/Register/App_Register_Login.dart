import 'package:final_project/LoginPage.dart';
import 'RegisterResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';





class RegisterSec extends StatefulWidget {
  @override
  _RegisterSecState createState() => _RegisterSecState();
}

class _RegisterSecState extends State<RegisterSec> {
  var _controllerName = TextEditingController();
  var _controllerEmail = TextEditingController();
  var _controllerPassword = TextEditingController();
  late String token1;
  late SharedPreferences getToken;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/amit.jpg",
                scale: .8,
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.all(0),
                    width: 300,
                    decoration:
                    BoxDecoration(border: Border.all(
                        color: Colors.black,// set border color
                        width: 2.0),   // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(15.0)), // set rounded corner radius
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _controllerName,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                      ),
                    )
                ),
              ),
              Container(
                  margin: EdgeInsets.all(15),
                  width: 300,
                  decoration:
                  BoxDecoration(border: Border.all(
                      color: Colors.black,// set border color
                      width: 2.0),   // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)), // set rounded corner radius
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      hintText: "Enter your E-Mail",
                    ),
                  )
              ),

              Container(
                  margin: EdgeInsets.all(15),
                  width: 300,
                  decoration:
                  BoxDecoration(border: Border.all(
                      color: Colors.black,// set border color
                      width: 2.0),   // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)), // set rounded corner radius
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                    ),
                  )
              ),

              Container(
                margin: EdgeInsets.fromLTRB(5, 40,5, 35),
                width: 175,
                height: 40,
                decoration:
                BoxDecoration(color: Color.fromARGB(195, 255, 0, 0),
                  borderRadius: BorderRadius.all(
                      Radius.circular(15.0)),
                ),
                child: TextButton(onPressed: (){
                  register();
               //    if (token1 != null){
               //      Navigator.of(context).push(MaterialPageRoute(
               //          builder: (BuildContext context) {
               //            ProdPage();
               //          }));
               //    }{
               //
               //    };
               //
                   },
                    child: Text("Sign Up",
                        style: TextStyle(color: Colors.white,fontSize: 20))),
                ),
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Text("Have an Account?",
                  style: TextStyle(color: Colors.black,fontSize: 16),),
              ),
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginPage();
                      }));
                },
                    child: Text("Go Login.",
                    style: TextStyle(color: Colors.black,fontSize: 16))),
              )
            ],
          ),
        ),
      ),



    );
  }



void register() async {
  Response response;
  var dio = Dio();

  response = await dio.post('https://retail.amit-learning.com/api/register',
      data: {
        "name": _controllerName.text,
        "email": _controllerEmail.text,
        "password": _controllerPassword.text,
      });
 // ResponseRegister register = ResponseRegister.fromJson(response.data);
  print(response.data.toString());
// Optionally the request above could also be done as
 ResponseRegister register = ResponseRegister.fromJson(response.data);

 if (register.token != null) {
   token1 =register.token!;
  }{}
}

}
