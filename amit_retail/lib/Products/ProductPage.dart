import 'package:dio/dio.dart';
import 'ProductSingle.dart';
import 'products1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProdPage extends StatefulWidget {
  @override
  _ProdPageState createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dioFetchAllData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: FutureBuilder<Products1>(
          future: dioFetchAllData1(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return CircularProgressIndicator();
            else if (snapshot.hasData) {
              Products1? products1 = snapshot.data;
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 2.4),
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: products1!.products!.length,
                  padding: EdgeInsets.all(7),
                  itemBuilder: (context, index) {
                    String? sname = products1.products![index].name;
                    String? stitle = products1.products![index].title;
                    String? sprice = products1.products![index].priceFinalText;
                    Products products = products1.products![index];
                    return InkWell(
                        onTap: () {

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ProdSingle(products: products,);
                              }));
                        },
                        highlightColor: Colors.red,
                        child: Stack(
                          children: [
                            Container(
                                //height: MediaQuery.of(context).size.height/5,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
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
                                right: 28,
                                top: 22,
                                width: 100,
                                height: 120,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/spinner-1.gif',
                                           image: '${products1.products![index].avatar}',
                                   ),
                                )),

                                    // Image.network(
                                    //   "${products1.products![index].avatar}",
                                    // ))),
                            Positioned(
                                left: 35,
                                top: 22,
                                width: 240,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: RichText(
                                        text: TextSpan(
                                            text: (stitle!.length < 22
                                                ? stitle
                                                : stitle.substring(0, 22) +
                                                    '...'),
                                            style: GoogleFonts.lato(
                                                color: Color.fromARGB(
                                                    255, 9, 35, 113),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            children: <TextSpan>[
                                              TextSpan(text: '')
                                            ]),
                                        maxLines: 1,
                                      ),
                                    ),
                                    // Divider(thickness: .01,),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(7, 5, 5, 5),
                                        child: Text(
                                          sname!.length < 55
                                              ? sname
                                              : sname.substring(0, 55) + '...',
                                          style: GoogleFonts.lato(
                                              color: Color.fromARGB(
                                                  255, 30, 37, 54),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))])),
                                    Positioned(
                                      bottom: 40,
                                    left: 40,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(5, 5, 5, 1),
                                      child: RichText(
                                        text: TextSpan(
                                            text: ("Price   "),
                                            style: GoogleFonts.lato(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            children: <TextSpan>[
                                              TextSpan(text: sprice,
                                                  style: GoogleFonts.lato(
                                                  color: Color.fromARGB(
                                                      255, 255, 0, 0),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)
                                              )
                                            ]),
                                      ),
                                    )),
                                        Positioned(
                                          right: 190,
                                          bottom: 37,
                                          child: Stack(
                                          children: [
                                            Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                                  borderRadius: BorderRadius.circular(5))),
                                              Positioned(
                                                  bottom: -10.2,
                                                right: -11,
                                                child: IconButton(onPressed: (){
                                                  AddCartSec(id1:'${products1.products![index].id}',
                                                    name: '${products1.products![index].name}',
                                                    avatar: '${products1.products![index].avatar}',
                                                    pricefinaltext: '${products1.products![index].priceFinalText}',
                                                    itemnum: StackSec.itemNum1,
                                                    title: '${products1.products![index].title}',);
                                                },
                                                  icon: Icon(Icons.add, size: 30,
                                                    color: Color.fromARGB(
                                                        255, 255,255, 255),), alignment: Alignment.center,),
                                            )
                                            ],
                                          )
                                      ,
                                    )
                                  ,
                                ]
                        )
                    );
                  });
            } else {
              return Center(child: Text("No Data Found"));
            }
          },
        ),
      ),
    );
  }
}


Future<Products1> dioFetchAllData1() async {
  Response response;
  var dio = Dio();
  response = await dio.get('https://retail.amit-learning.com/api/products');
  // print(response.data);
  Products1 list = Products1.fromJson(response.data);
  return list;
}
