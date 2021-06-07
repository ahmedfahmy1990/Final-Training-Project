import 'package:expandable_text/expandable_text.dart';
import '../Cart/Cart.dart';
import 'package:final_project/main.dart';
import 'products1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../Cart/DBHelper2.dart';

class ProdSingle extends StatelessWidget {
  String? avatar;
  String? title;
  String? name;
  String? description;
  late Products products;
  ProdSingle({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${products.title}"),
        backgroundColor: Color.fromARGB(255, 15, 88, 111),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(6, 1, 1, 20),
                  width: 270,
                  height: 270,
                  child: Image.network(
                    "${products.avatar}",
                    alignment: Alignment.center,
                  )),
              Padding(
                padding: EdgeInsets.all(7),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("${products.title}",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "RobotoMono",
                            fontSize: 22))),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("${products.name}",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "RobotoMono",
                              fontSize: 16)))),
              Divider(
                thickness: 2.5,
                color: Colors.black87,
              ),
              StackSec(priceFinal: "${products.priceFinalText}",),
              Divider(
                thickness: 2.5,
                color: Colors.black87,
              ),
              Divider(
                color: Colors.white,
              ),
              ExpandableText("${products.description}",
                  expandText: 'show more',
                  collapseText: 'show less',
                  maxLines: 3,
                  linkColor: Colors.blue),
              AddCartSec(id1:'${products.id}', name: '${products.name}',
                avatar: '${products.avatar}', pricefinaltext: '${products.priceFinalText}',
                itemnum: StackSec.itemNum1, title: '${products.title}',),
            ],
          ),
        ),
      ),
    );
  }
}




class StackSec extends StatefulWidget {
  late String priceFinal;
  static late int itemNum1 = 1;
  //static late SharedPreferences itemNum3;
  StackSec ({ Key? key, required this.priceFinal }): super(key: key);
  @override
  _StackSecState createState() => _StackSecState();
}

class _StackSecState extends State<StackSec> {
  late int itemNum=1;
  //late final SharedPreferences itemNum3;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   widget.itemNum3.setInt("itemsNum", 1);
  // }
  // void getItemsNum() async {
  //   widget.itemNum3 = await SharedPreferences.getInstance();
  //   widget.itemNum3.setInt("itemsNum", itemNum);
  // }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 30,
      ),
      Positioned(
        top: 4,
        child: Text(
          (widget.priceFinal),
          style: TextStyle(
            color: Color.fromARGB(223, 255, 0, 0),
            fontSize: 20,
          ),
        ),
      ),
      Positioned(
        right: 150,
        child: Stack(children: [
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Color.fromARGB(208, 255, 0, 0),
                  borderRadius: BorderRadius.circular(5))),
          Positioned(
            right: -9,
            top: -14,
            child: IconButton(
              onPressed: () {
              setState(() {
                if (itemNum < 2) {
              }
                else{ itemNum -=1;
                     StackSec.itemNum1=itemNum;
                }
              });},
              icon: Icon(
                Icons.minimize_rounded,
                size: 22,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ]),
      ),
      Positioned(
        right: 60,
        top: 2,
        child: Container(
          width: 70,
          height: 27,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: Colors.black38, // set border color
                  width: 1.5)),
          child: Center(child: Text("$itemNum", style: TextStyle(fontSize: 18),)),
        ),
      ),
      Positioned(
        right: 10,
        top: -10,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(1, 10, 1, 1),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Color.fromARGB(208, 255, 0, 0),
                    borderRadius: BorderRadius.circular(5))),
            Positioned(
              right: -7,
              top: 2,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    itemNum += 1;
                    StackSec.itemNum1=itemNum;
                  });
                },
                icon: Icon(
                  Icons.add_outlined,
                  size: 22,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      )
    ]
    );
  }
}






class AddCartSec extends StatefulWidget {
  late String id1;
  late String name;
  late String title;
  late String avatar;
  late String pricefinaltext;
  late int itemnum;
  AddCartSec ({ Key? key, required this.id1, required this.name, required this.title,
    required this.avatar, required this.pricefinaltext,
    required this.itemnum }): super(key: key);


  @override
  _AddCartSecState createState() => _AddCartSecState();
}

class _AddCartSecState extends State<AddCartSec> {
  static Database? _db;
  late Map<String, dynamic> row;
  late DBHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  void addToCart()async {
    row = {
      "id": widget.id1,
      "name": widget.name,
      "title": widget.title,
      "avatar": widget.avatar,
      "pricefinaltext": widget.pricefinaltext,
      "itemnum": widget.itemnum,
    };
    int id = await dbHelper.insertProduct(row);
  }

  void clearCart(){
    dbHelper.deleteAll();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 400,
            margin: EdgeInsets.fromLTRB(1, 30, 1, 0),
            decoration: BoxDecoration(
                color: Color.fromARGB(210, 255, 0, 0),
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: () {
                  addToCart();
                },
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))),
        Container(
            width: 200,
            height: 35,
            margin: EdgeInsets.fromLTRB(1,7, 1, 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(213, 0, 121, 168),
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MyApp2();
                        }));
                  });
                },
                child: Text(
                  "Go To Cart",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ))),
      ],
    );
  }
}





