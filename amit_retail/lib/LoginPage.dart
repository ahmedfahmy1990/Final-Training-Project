import 'package:dio/dio.dart';
import 'Register/App_Register_Login.dart';
import 'Register/RegisterResponse.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _controllerEmail = TextEditingController();
  var _controllerPassword = TextEditingController();
  bool _obscureText = true;
  String? getToken;
  late final SharedPreferences tokenPerfs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTToken();
  }

  void getTToken() async {
    tokenPerfs = await SharedPreferences.getInstance();
    setState(() {
      getToken = (tokenPerfs.getString("token") != null
          ? tokenPerfs.getString("token")
          : null)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (getToken == null) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/amit.jpg",
                  scale: .6,
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black, // set border color
                            width: 2.0), // set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(15.0)), // set rounded corner radius
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _controllerEmail,
                        decoration: InputDecoration(
                          hintText: "Enter your E-Mail",
                          border: InputBorder.none,
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, // set border color
                        width: 2.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)), // set rounded corner radius
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: InputBorder.none,
                      suffixIcon: new GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: new Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.white,),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 40, 5, 35),
                  width: 175,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(195, 255, 0, 0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: TextButton(
                      onPressed: () {
                        login();
                        saveToken();
                        if (getToken != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return MyApp2();
                          }));
                          saveToken();
                        } else {
                          AlertDialog(
                            title: Text("Wrong Authentication"),
                            content:
                                Text("you have entered wrong mail or password"),
                            actions: [
                              TextButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        }
                        ;
                      },
                      child: Text("Login",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
                Divider(color: Colors.white,thickness: 5,height: 20,),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: Text(
                    "Don't have an Account?",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return RegisterSec();
                        }));
                      },
                      child: Text("Go sign Up",
                          style: TextStyle(color: Colors.black, fontSize: 18))),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return MyApp2();
    }
  }

  void login() async {
    if (getToken == null) {
      Response response;
      var dio = Dio();
      response =
          await dio.post('https://retail.amit-learning.com/api/login', data: {
        "email": _controllerEmail.text,
        "password": _controllerPassword.text,
      });
      // ResponseRegister register = ResponseRegister.fromJson(response.data);
      //print(response.data.toString());
// Optionally the request above could also be done as
      ResponseRegister register = ResponseRegister.fromJson(response.data);
      if (register.token != null) {
        getToken = register.token!;
      }
      {}
    }
  }

  saveToken() async {
    tokenPerfs.setString("token", getToken!);
  }
}
