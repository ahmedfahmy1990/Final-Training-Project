import 'package:final_project/LoginPage.dart';
import 'Cart/Cart.dart';
import 'Categories/categoriesPage.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Products/ProductPage.dart';
import 'LoginPage.dart';
import 'Register/App_Register_Login.dart';



void main() {
  runApp(AmitRetail());
}



class AmitRetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Amit Retail",
        theme: ThemeData(
           primaryColor: Colors.black,
          //backgroundColor: Colors.black,
          //accentColor: Colors.orange,
          //buttonColor: Colors.green,
            textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.black, fontSize: 17),
              headline1: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              )),
        initialRoute: "/",
        routes: {
           "/": (context) => MainScreen(),
         "/LoginPage": (context) => LoginPage(),
          "/RegisterSec":(context) => RegisterSec(),
          "/HomeScreen": (context) => MyApp2(),

        }
          // tokenPerfs.getString("token")!=null ? MyApp2() : LoginPage(),
          // "/LaunchSec": (context) => LaunchSec(),
          //"/SoundNot": (context) => SoundNot(),
          //"/Set2Screen": (context) => Setting2(),
        );
  }
}



class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoginPage(),
    );
  }
}




class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int _currentIndex=0;
  List<Widget> _widgetScreen=<Widget>[
    ProdPage(),
    CatePage(),
    CartPage1(),
    HomePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("AMIT Retail"),
          backgroundColor: Color.fromARGB(255, 15, 88, 111),),
        body: Center(child: Container(
            child:
         _widgetScreen.elementAt(_currentIndex)
        )),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color.fromARGB(255, 238, 8, 8),
          unselectedItemColor: Color.fromARGB(255, 68, 68, 68),
          unselectedLabelStyle: TextStyle(color: Colors.red),
          showUnselectedLabels: true,
          selectedFontSize: 16,
          backgroundColor: Colors.blueGrey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home)
                ,label: "Home"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.category_outlined)
                ,label: "Categories"
            ),    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)
                ,label: "Cart")
          ,   BottomNavigationBarItem(icon: Icon(Icons.menu)
                ,label: "Menu")],
          currentIndex: _currentIndex ,
          onTap: (value) {
            setState(() {
              _currentIndex=value;
            });
          },
        ),
      ),
    );
  }
}




