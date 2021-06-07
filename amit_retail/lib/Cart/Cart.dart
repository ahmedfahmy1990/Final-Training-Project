import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'DBHelper2.dart';


// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   String id = 'id';
//   String name = 'name';
//   String title = 'title';
//   String avatar = 'avatar';
//   String pricefinaltext = 'price_final_text';
//   static Database? _db;
//   late Map<String, dynamic> row;
//   late DBHelper dbHelper;
//   int? items1;
//
//   @override
//   void initState() {
//     super.initState();
//     dbHelper = DBHelper();
//   }
//
//   void addToCart() async {
//     row = {
//       "id": 2,
//       "name": "1",
//       "title": "fg",
//       "avatar": "avatar",
//       "pricefinaltext": "pricefinaltext",
//       "itemnum": 5,
//     };
//     int id = await dbHelper.insertProduct(row);
//   }
//
//
//
//   void clearCart() {
//     dbHelper.deleteAll();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         // margin: EdgeInsets.all(5),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   child: FutureBuilder<List<dynamic>>(
//                     future: dbHelper.allProducts(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             TextButton(onPressed: () {},
//                                 child: Text(
//                                   "Your Shopping cart is empty \n please add some products to proceed",
//                                   style: TextStyle(
//                                       color: Colors.indigo, fontSize: 18
//                                   ),))
//                           ],
//                         );
//                       } else {
//                         List? allproducts = snapshot.data;
//                         return
//                           GridView.builder(
//                             shrinkWrap: true,
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 1, childAspectRatio:2.6),
//                             scrollDirection: Axis.vertical,
//                             physics: NeverScrollableScrollPhysics(),
//                             itemCount: allproducts!.length,
//                             padding: EdgeInsets.all(7),
//                             itemBuilder: (context, index) {
//                               String? sname = allproducts[index]["name"];
//                               String? stitle = allproducts[index]["title"];
//                               String? sprice = allproducts[index]["pricefinaltext"];
//                               String? savatar = allproducts[index]["avatar"];
//                               int? sid = allproducts[index]["id"];
//                                int items = allproducts[index]["itemnum"];
//                                int items1 = items;
//                               return Stack(
//                                   children: [
//                                     Container(
//                                       //height: MediaQuery.of(context).size.height/5,
//                                         margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.circular(2)
//                                             // image: DecorationImage(
//                                             //   image: NetworkImage('${products1.products![index].avatar}'),
//                                             //   fit: BoxFit.cover,
//                                             ,
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Colors.grey.withOpacity(0.4),
//                                                 spreadRadius: 3,
//                                                 blurRadius: 7,
//                                                 offset: Offset(
//                                                     0, 2), // changes position of shadow
//                                               ),
//                                             ])),
//                                     Positioned(
//                                         left: 13,
//                                         top: 25,
//                                         width: 100,
//                                         height: 100,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(10)),
//                                           child: FadeInImage.assetNetwork(
//                                             placeholder: 'assets/images/spinner-1.gif',
//                                             image: '$savatar',
//                                           ),
//                                         )),
//
//                                     // Image.network(
//                                     //   "${products1.products![index].avatar}",
//                                     // ))),
//                                     Positioned(
//                                         right: 35,
//                                         top: 22,
//                                         width: 240,
//                                         child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment
//                                                 .start,
//                                             children: [
//                                               Container(
//                                                 child: RichText(
//                                                   text: TextSpan(
//                                                       text: (stitle!.length < 30
//                                                           ? stitle
//                                                           : stitle.substring(0, 30) +
//                                                           '...'),
//                                                       style: TextStyle(
//                                                           color: Color.fromARGB(
//                                                               255, 0, 0, 10),
//                                                           fontSize: 18,
//                                                           fontWeight: FontWeight.bold),
//                                                       children: <TextSpan>[
//                                                         TextSpan(text: '')
//                                                       ]),
//                                                   maxLines: 1,
//                                                 ),
//                                               ),
//                                               // Divider(thickness: .01,),
//                                               Container(
//                                                   margin: EdgeInsets.fromLTRB(
//                                                       1, 8, 3, 5),
//                                                   child: Text(
//                                                     sname!.length < 55
//                                                         ? sname
//                                                         : sname.substring(0, 55) +
//                                                         '...',
//                                                     style: TextStyle(
//                                                         color: Color.fromARGB(
//                                                             255, 30, 37, 54),
//                                                         fontSize: 13,
//                                                         fontWeight: FontWeight.bold),
//                                                   ))
//                                             ])),
//                                     Positioned(
//                                         bottom: 40,
//                                         right: 140,
//                                         child: Container(
//                                           width:130,
//                                           margin: EdgeInsets.fromLTRB(1, 5, 5, 1),
//                                           child: RichText(
//                                             text: TextSpan(
//                                                 text: ("Price   "),
//                                                 style: TextStyle(
//                                                     color: Color.fromARGB(
//                                                         255, 0, 0, 0),
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.bold),
//                                                 children: <TextSpan>[
//                                                   TextSpan(text: sprice,
//                                                       style: TextStyle(
//                                                           color: Color.fromARGB(
//                                                               255, 255, 0, 0),
//                                                           fontSize: 16,
//                                                           fontWeight: FontWeight.bold)
//                                                   )
//                                                 ]),
//                                           ),
//                                         )),
//                                     Positioned(
//                                       right: 10,
//                                       bottom: 40,
//                                       child: Stack(
//                                         children: [
//                                           Container(
//                                             height: 30,
//                                             width: 160,
//                                           ),
//                                           Positioned(
//                                             right: 110,
//                                             bottom:0,
//                                             child: Stack(children: [
//                                               Container(
//                                                   width: 23,
//                                                   height: 23,
//                                                   decoration: BoxDecoration(
//                                                       color: Color.fromARGB(208, 255, 0, 0),
//                                                       borderRadius: BorderRadius.circular(5))),
//                                               Positioned(
//                                                 right: -12,
//                                                 top: -18,
//                                                 child: IconButton(
//                                                   onPressed: () {
//                                                     setState(() {
//                                                       if (items1 < 2) {
//                                                       }
//                                                       else{ items1 -=1;
//                                                       }
//                                                     });},
//                                                   icon: Icon(
//                                                     Icons.minimize_rounded,
//                                                     size: 22,
//                                                     color: Color.fromARGB(255, 255, 255, 255),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]),
//                                           ),
//                                           Positioned(
//                                             right: 50,
//                                             top: 9.5,
//                                             child: Container(
//                                               width: 50,
//                                               height: 20,
//                                               decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(3),
//                                                   border: Border.all(
//                                                       color: Colors.black38, // set border color
//                                                       width: 1.5)),
//                                               child: Center(child: Text("$items1",
//                                                 style: TextStyle(fontSize: 16),)),
//                                             ),
//                                           ),
//                                           Positioned(
//                                             right: 16,
//                                             top: -3,
//                                             child: Stack(
//                                               children: [
//                                                 Container(
//                                                     margin: EdgeInsets.fromLTRB(1, 10, 1, 1),
//                                                     width: 23,
//                                                     height: 23,
//                                                     decoration: BoxDecoration(
//                                                         color: Color.fromARGB(208, 255, 0, 0),
//                                                         borderRadius: BorderRadius.circular(5))),
//                                                 Positioned(
//                                                   right: -11.5,
//                                                   top: -1.5,
//                                                   child: IconButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         items1 += 1;
//                                                       });
//                                                     },
//                                                     icon: Icon(
//                                                       Icons.add_outlined,
//                                                       size: 22,
//                                                       color: Color.fromARGB(255, 255, 255, 255),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )
//
//                                         ],
//
//
//
//
//
//
//
//
//                                       ),
//                                     )
//                                     ,
//                                   ]
//                               );
//                             }
//                         );
//                       }
//                     },
//                   ),
//                 ),
//
//
//                 Container(
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(20),
//                         height: 35,
//                         width: 160,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           // border: Border.all(color: Colors.black54,
//                           // ),
//                           borderRadius: BorderRadius.circular(2),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromARGB(255, 69, 68, 68).withOpacity(0.7),
//                               spreadRadius: 2,
//                               blurRadius: 0,
//                               offset: Offset(0, 1),
//                             ),
//                           ]),
//                       child: TextButton(child: Text("Clear Cart",
//                           style: TextStyle(
//                             color: Colors.black, fontSize: 15
//                           ),),
//                           onPressed: () {
//                            clearCart();
//                            setState(() {
//
//                            });
//
//                           },
//                         )
//                       ),
//
//                       Container(
//                           margin: EdgeInsets.all(20),
//                           height: 35,
//                           width: 160,
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(143, 255, 0, 0),
//                               // border: Border.all(color: Colors.black54,
//                               // ),
//                               borderRadius: BorderRadius.circular(2),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color.fromARGB(193, 255, 0, 0).withOpacity(0.7),
//                                   spreadRadius: 2,
//                                   blurRadius:0,
//                                   offset: Offset(0, 1),
//                                 ),
//                               ]),
//                           child: TextButton(onPressed: () {
//
//                           },
//                             child: Text("Go To Checkout",
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 15
//                               ),),
//
//                           )
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//       ),
//     );
//   }
// }


class CartPage1 extends StatefulWidget {

  @override
  _CartPage1State createState() => _CartPage1State();
}

class _CartPage1State extends State<CartPage1> {
  String id = 'id';
  String name = 'name';
  String title = 'title';
  String avatar = 'avatar';
  String pricefinaltext = 'price_final_text';
  static Database? _db;
  late Map<String, dynamic> row;
  late DBHelper dbHelper;
  int? items1;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  void addToCart() async {
    row = {
      "id": 2,
      "name": "1",
      "title": "fg",
      "avatar": "avatar",
      "pricefinaltext": "pricefinaltext",
      "itemnum": 5,
    };
    int id = await dbHelper.insertProduct(row);
  }



  void clearCart() {
    dbHelper.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: FutureBuilder<List<dynamic>>(
                    future: dbHelper.allProducts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(onPressed: () {},
                                child: Text(
                                  "Your Shopping cart is empty \n please add some products to proceed",
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 18
                                  ),))
                          ],
                        );
                      } else {
                        List? allproducts = snapshot.data;
                        return
                          GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, childAspectRatio:2.6),
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: allproducts!.length,
                              padding: EdgeInsets.all(7),
                              itemBuilder: (context, index) {
                                String? sname = allproducts[index]["name"];
                                String? stitle = allproducts[index]["title"];
                                String? sprice = allproducts[index]["pricefinaltext"];
                                String? savatar = allproducts[index]["avatar"];
                                int? sid = allproducts[index]["id"];
                                late int items = allproducts[index]["itemnum"];
                                return Stack(
                                    children: [
                                      Container(
                                        //height: MediaQuery.of(context).size.height/5,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(2)
                                              // image: DecorationImage(
                                              //   image: NetworkImage('${products1.products![index].avatar}'),
                                              //   fit: BoxFit.cover,
                                              ,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.4),
                                                  spreadRadius: 3,
                                                  blurRadius: 7,
                                                  offset: Offset(
                                                      0, 2), // changes position of shadow
                                                ),
                                              ])),
                                      Positioned(
                                          left: 13,
                                          top: 25,
                                          width: 100,
                                          height: 100,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            child: FadeInImage.assetNetwork(
                                              placeholder: 'assets/images/spinner-1.gif',
                                              image: '$savatar',
                                            ),
                                          )),

                                      // Image.network(
                                      //   "${products1.products![index].avatar}",
                                      // ))),
                                      Positioned(
                                          right: 35,
                                          top: 22,
                                          width: 240,
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Container(
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text: (stitle!.length < 30
                                                            ? stitle
                                                            : stitle.substring(0, 30) +
                                                            '...'),
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 0, 0, 10),
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold),
                                                        children: <TextSpan>[
                                                          TextSpan(text: '')
                                                        ]),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                // Divider(thickness: .01,),
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        1, 8, 3, 5),
                                                    child: Text(
                                                      sname!.length < 55
                                                          ? sname
                                                          : sname.substring(0, 55) +
                                                          '...',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 30, 37, 54),
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.bold),
                                                    ))
                                              ])),
                                      Positioned(
                                          bottom: 40,
                                          right: 140,
                                          child: Container(
                                            width:130,
                                            margin: EdgeInsets.fromLTRB(1, 5, 5, 1),
                                            child: RichText(
                                              text: TextSpan(
                                                  text: ("Price   "),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
                                                  children: <TextSpan>[
                                                    TextSpan(text: sprice,
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 255, 0, 0),
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold)
                                                    )
                                                  ]),
                                            ),
                                          )),
                                      Positioned(
                                        right: 10,
                                        bottom: 40,
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 160,
                                            ),
                                            Positioned(
                                              right: 110,
                                              bottom:0,
                                              child: Stack(children: [
                                                Container(
                                                    width: 23,
                                                    height: 23,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(208, 255, 0, 0),
                                                        borderRadius: BorderRadius.circular(5))),
                                                Positioned(
                                                  right: -12,
                                                  top: -18,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        if (items < 2) {
                                                        }
                                                        else{ items -=1;
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
                                              right: 50,
                                              top: 9.5,
                                              child: Container(
                                                width: 50,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(3),
                                                    border: Border.all(
                                                        color: Colors.black38, // set border color
                                                        width: 1.5)),
                                                child: Center(child: Text("$items",
                                                  style: TextStyle(fontSize: 16),)),
                                              ),
                                            ),
                                            Positioned(
                                              right: 16,
                                              top: -3,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.fromLTRB(1, 10, 1, 1),
                                                      width: 23,
                                                      height: 23,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromARGB(208, 255, 0, 0),
                                                          borderRadius: BorderRadius.circular(5))),
                                                  Positioned(
                                                    right: -11.5,
                                                    top: -1.5,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          items += 1;
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

                                          ],








                                        ),
                                      )
                                      ,
                                    ]
                                );
                              }
                          );
                      }
                    },
                  ),
                ),


                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.all(20),
                          height: 35,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.black54,
                              // ),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 69, 68, 68).withOpacity(0.7),
                                  spreadRadius: 2,
                                  blurRadius: 0,
                                  offset: Offset(0, 1),
                                ),
                              ]),
                          child: TextButton(child: Text("Clear Cart",
                            style: TextStyle(
                                color: Colors.black, fontSize: 15
                            ),),
                            onPressed: () {
                              clearCart();
                              setState(() {

                              });

                            },
                          )
                      ),

                      Container(
                          margin: EdgeInsets.all(20),
                          height: 35,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(143, 255, 0, 0),
                              // border: Border.all(color: Colors.black54,
                              // ),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(193, 255, 0, 0).withOpacity(0.7),
                                  spreadRadius: 2,
                                  blurRadius:0,
                                  offset: Offset(0, 1),
                                ),
                              ]),
                          child: TextButton(onPressed: () {

                          },
                            child: Text("Go To Checkout",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15
                              ),),

                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
