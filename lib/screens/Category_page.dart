import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kf_drawer/kf_drawer.dart';
 import 'ProductsList.dart';
import 'package:flip_card/flip_card.dart';
import 'package:expansion_card/expansion_card.dart';
class CategoryPage extends KFDrawerContent {
  final menORwomen;
  final mail;

  CategoryPage({Key key, this.menORwomen,this.mail})  ;
  @override
  _CategoryPageState createState() => _CategoryPageState(menORwomen,mail);
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> category1=["UP TO 40% OFF","Vigitables & Fruits","Buy Vegitables, Frouts, Vegitables & Frouts Cleaners"];
  List<String> category2=["UP TO 50% OFF","Grocery & Staples","Buy Atta and other flours, Rice, Nuts, Dry frouts etc"];

  String menORwomenx;
  String username;
  _CategoryPageState(String menORwomen,String  mail){
    menORwomenx=menORwomen;
    username=mail;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black12,
           padding: EdgeInsets.only(bottom: 20,top: 20),

          child: Column(
            children: [
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: widget.onMenuPressed,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width-120,
                      alignment: Alignment.center,
                      child:  Text("Category", style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Spectral",
                      ),)
                  ),

                ],
              ),

            StreamBuilder(
             // ignore: deprecated_member_use
             stream: Firestore.instance.collection("Category").doc("icondata").collection("froutsandvegitable").doc("a0").snapshots(),
              builder: (context, snapshot) {
              if (!snapshot.hasData) {
              return new Text("Loading");
              }
               var userDocument = snapshot.data;
            // picture1[index] = userDocument["pic1"];


             return   FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                margin: EdgeInsets.only(left: 5,right: 5),

                padding: EdgeInsets.all(7),
                 color: Colors.white54,
                height: 160,
                  child: Row(
                   children: [
                     Container(
                       width: 100,
                       height: 100,
                        child: Image.network(userDocument["pic1"],fit: BoxFit.fill,),
                     ),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           child: Text(category1[0],style: TextStyle(fontSize: 20,fontFamily: "Spectral",
                           fontWeight: FontWeight.w500,color: Colors.green)),
                         ),
                         Container(
                           child: Text(category1[1],style: TextStyle(fontSize: 20,fontFamily: "Spectral",
                               fontWeight: FontWeight.w700,color: Colors.black)),
                         ),
                         Container(
                            child: Text(category1[2],style: TextStyle(fontSize: 10,fontFamily: "Spectral"),),
                         )
                       ],
                     )
                   ],
                 ),
              ),
              back: Container(
                  margin: EdgeInsets.only(left: 5,right: 5,),

                  height: 160,
                  color: Colors.white54,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 90,
                            child: Image.network(userDocument["pic2"],),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsList(
                                Categorypath: "Frouts",mail: username,
                              ) ));
                            },
                            child: Container(
                              child: Text("Frouts",style: TextStyle(fontSize: 20,fontFamily: "Spectral",
                                  fontWeight: FontWeight.w500,color: Colors.black)),
                            ),
                          ),
                          Container(
                            child: Text("UP TO 15% OFF",style: TextStyle(fontSize: 12,fontFamily: "Spectral",
                                fontWeight: FontWeight.w500,color: Colors.green)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,

                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 90,
                            child: Image.network(userDocument["pic3"],),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsList(
                                Categorypath: "Vegitables",mail: username,
                              ) ));
                            },
                            child: Container(
                              child: Text("Vegitables",style: TextStyle(fontSize: 20,fontFamily: "Spectral",
                                  fontWeight: FontWeight.w500,color: Colors.black)),
                            ),
                          ),
                          Container(
                            child: Text("UP TO 30% OFF",style: TextStyle(fontSize: 12,fontFamily: "Spectral",
                                fontWeight: FontWeight.w500,color: Colors.green)),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: 100,

                      margin: EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 90,
                            child: Image.network(userDocument["pic4"],),
                          ),
                          Container(
                            child: Text("cleaner",style: TextStyle(fontSize: 20,fontFamily: "Spectral",
                                fontWeight: FontWeight.w500,color: Colors.black)),
                          ),
                          Container(
                            child: Text("UP TO 25% OFF",style: TextStyle(fontSize: 12,fontFamily: "Spectral",
                                fontWeight: FontWeight.w500,color: Colors.green)),
                          ),

                        ],
                      ),
                    )
                  ],
                )
              ),
            );
            }

            ),
              SizedBox(height: 10,),
              StreamBuilder(
                // ignore: deprecated_member_use
                  stream: Firestore.instance.collection("Category").doc("icondata").collection("froutsandvegitable").doc("a1").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text("Loading");
                    }
                    var userDocument = snapshot.data;
                    // picture1[index] = userDocument["pic1"];


                    return   FlipCard(
                      direction: FlipDirection.HORIZONTAL, // default
                      front: Container(

                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(left: 5,right: 5),
                        color: Colors.white54,
                        height: 160,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(userDocument["pic1"],fit: BoxFit.fill,),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(category2[0],style: TextStyle(fontSize: 20,fontFamily: "Spectral",
                                      fontWeight: FontWeight.w500,color: Colors.green)),
                                ),
                                Container(
                                  child: Text(category2[1],style: TextStyle(fontSize: 20,fontFamily: "Spectral",
                                      fontWeight: FontWeight.w700,color: Colors.black)),
                                ),
                                Container(
                                  child: Text(category2[2],style: TextStyle(fontSize: 10,fontFamily: "Spectral"),),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      back: Container(
                          margin: EdgeInsets.only(left: 5,right: 5),

                          height: 160,
                          color: Colors.white54,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.blueAccent)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 90,
                                      child: Image.network(userDocument["pic2"],),
                                    ),
                                    Container(
                                      child: Text("Atta",style: TextStyle(fontSize: 18,fontFamily: "Spectral",
                                          fontWeight: FontWeight.w500,color: Colors.black)),
                                    ),
                                    Container(
                                      child: Text("UP TO 15% OFF",style: TextStyle(fontSize: 12,fontFamily: "Spectral",
                                          fontWeight: FontWeight.w500,color: Colors.green)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.blueAccent)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 90,
                                      child: Image.network(userDocument["pic3"],),
                                    ),
                                    Container(
                                      child: Text("Dry frouts",style: TextStyle(fontSize: 18,fontFamily: "Spectral",
                                          fontWeight: FontWeight.w500,color: Colors.black)),
                                    ),
                                    Container(
                                      child: Text("UP TO 35% OFF",style: TextStyle(fontSize: 12,fontFamily: "Spectral",
                                          fontWeight: FontWeight.w500,color: Colors.green)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,

                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.blueAccent)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 90,
                                      child: Image.network(userDocument["pic4"],),
                                    ),
                                    Container(
                                      child: Text("Rice",style: TextStyle(fontSize: 18,fontFamily: "Spectral",
                                          fontWeight: FontWeight.w500,color: Colors.black)),
                                    ),
                                    Container(
                                      child: Text("UP TO 30% OFF",style: TextStyle(fontSize: 12,fontFamily: "Spectral",
                                          fontWeight: FontWeight.w500,color: Colors.green)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    );
                  }

              ),

            ],
          ),
        ),
      ),
    );
  }
}
