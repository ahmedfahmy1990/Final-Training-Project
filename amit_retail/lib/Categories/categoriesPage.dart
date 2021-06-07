import 'package:dio/dio.dart';
import 'categories1.dart';
import 'package:flutter/material.dart';

class CatePage extends StatefulWidget {
  @override
  _CatePageState createState() => _CatePageState();
}

class _CatePageState extends State<CatePage> {
  late double width1;
  late double height1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Color.fromARGB(100, 121, 121, 121)),
        child: FutureBuilder<Categories1>(
          future: dioFetchAllData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return CircularProgressIndicator();
            else if (snapshot.hasData) {
              // double width1 = MediaQuery.of(context).size.width;
              // double height1 = MediaQuery.of(context).size.height;
              Categories1? categories1 = snapshot.data;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,childAspectRatio: 1.2 ),
                  scrollDirection: Axis.vertical,
                  itemCount: categories1!.categories!.length,
                  padding: EdgeInsets.all(2),
                  itemBuilder: (context, index) {
                    Categories categories = categories1.categories![index];
                    return InkWell(onTap: (){

                    },
                      //focusColor: Colors.grey,
                      //hoverColor: Colors.red,
                      highlightColor: Colors.red,
                      child: Container(
                        //height: MediaQuery.of(context).size.height/5,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            NetworkImage('${categories.avatar}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text("${categories.name}",
                            style: TextStyle(color: Colors.white, fontSize: 25,
                                backgroundColor: Color.fromARGB(
                                    191, 57, 57, 57)),)
                        ),
                      ),
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

Future<Categories1> dioFetchAllData() async {
  Response response;
  var dio = Dio();
  response = await dio.get('https://retail.amit-learning.com/api/categories');
  //print(response.data);
  Categories1 categories = Categories1.fromJson(response.data);
  return categories;
}

// ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.vertical,
// itemCount: categories1!.categories!.length,
//
// itemBuilder: (context, index) {
// Categories categories=categories1.categories![index];
// return  ListTile(
// onTap:() {
// } ,
// title: Text("${categories.name}",
// style: TextStyle(color: Colors.black, fontSize: 12),),
// subtitle: Text("ghfghfghfghfgh"),
// //leading: CircleAvatar(child: Text(capsules.serial.substring(0,1)),),
// );
// },
// );
