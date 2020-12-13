
 import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nature_store/screens/CheckoutPage.dart';
import 'package:nature_store/screens/main_page.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'cart_screen.dart';
 TextEditingController qty=new TextEditingController();
final databaseReference = Firestore.instance;


class ProductDetailsPage extends StatefulWidget {

  final path1,path2,path3,path4,mail;

  const ProductDetailsPage({Key key, this.path1, this.path2, this.path3, this.path4, this.mail}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState(mail,path1,path2,path3,path4);
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProgressDialog pr;

  String mailx,path1x,path2x,path3x,path4x;

  _ProductDetailsPageState(mail,path1,path2,path3,path4){
    mailx=mail;path1x=path1;path2x=path2;path3x=path3;path4x=path4;
  }
   String pic1,pic2,pic3,pic4,name1,name2,originalpricez,finalpricez,offer;

  @override
  Widget build(BuildContext context) {


    pr = new ProgressDialog(context);
    pr.style(
        message: 'Adding to Cart..', borderRadius: 10.0, backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(), elevation: 10.0, insetAnimCurve: Curves.easeInOut,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600)
    );

    return Scaffold(

        appBar: AppBar(title: Text("Details"), backgroundColor: Color(0xff0f4c81),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CartScreen(username: mailx,)));
              },
            ),
          ],),
        body: SingleChildScrollView(
          child:  Container(
             child: Column(
              children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),

                      height: MediaQuery.of(context).size.height*0.55,
                      width: MediaQuery.of(context).size.height,
                      child: DotPaginationSwiper(
                       children: <Widget>[
                        StreamBuilder(
                            stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              }
                            //  var userDocument = snapshot.data;
                              DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];

                              pic1=products["pic1"];
                              // pic2=products["pic2"];
                              // pic3=products["pic3"];
                              // pic4=products["pic4"];
                              name1=products["name1"];
                              name2=products["name2"];
                              offer=products["offer"];





                              // picture1[index] = userDocument["pic1"];
                              return   Container(
                                child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(products["pic1"],

                                    fit: BoxFit.cover,
                                  ) ,
                                ),
                              );
                            }
                        ),
                        StreamBuilder(
                            stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              }
                              DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];

                              // var userDocument = snapshot.data;

                              // picture1[index] = userDocument["pic1"];
                              return   Container(

                                child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(products["pic1"],

                                    fit: BoxFit.cover,
                                  ) ,
                                ),
                              );
                            }
                        ),
                        StreamBuilder(
                            stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              }
                              DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];


                              // var userDocument = snapshot.data;

                              // picture1[index] = userDocument["pic1"];
                              return   Container(

                                child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(products["pic1"],

                                    fit: BoxFit.cover,
                                  ) ,
                                ),
                              );
                            }
                        ),
                        StreamBuilder(
                            stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              }
                              DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];

                              // var userDocument = snapshot.data;

                              // picture1[index] = userDocument["pic1"];
                              return   Container(

                                child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(products["pic1"],

                                    fit: BoxFit.cover,
                                  ) ,
                                ),
                              );
                            }
                        ),

                      ],
                    ),
                  ),
              Container(
                margin: EdgeInsets.only(top: 2,left: 5,right: 5),
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: new BorderRadius.circular(10)),
                child:
                Column(
                  children: <Widget>[
                    StreamBuilder(
                        stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return new Text("Loading");
                          }
                          DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];

                          //var userDocument = snapshot.data;

                          // picture1[index] = userDocument["pic1"];
                          return     Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(7),

                            child:  Text(products["name1"],maxLines: 1,style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Spectral",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,

                            ),
                            ),
                          );
                        }
                    ),
                    StreamBuilder(
                        stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return new Text("Loading");
                          }
                          DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];

                          // var userDocument = snapshot.data;

                          // picture1[index] = userDocument["pic1"];
                          return Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(7),

                            child: Text(products["name2"],maxLines: 1,style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600 ,
                                fontFamily: "Spectral",
                                color: Colors.white
                            ),
                            ) ,
                          );
                        }
                    ),


                    Row(
                      children: <Widget>[
                        StreamBuilder(
                            stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              }
                              DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];

                              //  var userDocument = snapshot.data;
                              // picture1[index] = userDocument["pic1"];

                              var price =  int.parse(products["price"]);
                              assert(price is int);
                              var offer = int.parse(products["offer"]);
                              assert(offer is int);
                              var finalprice = (price*offer)/100;
                              var finalpricexx = price-finalprice;
                              var finalpricexxx=  finalpricexx.round();

                              finalpricez=finalpricexxx.toString();

                              return   Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("₹"+finalpricexxx.toString(),style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Spectral",

                                  fontWeight: FontWeight.w700,

                                ),
                                ),
                              );
                            }
                        ),
                        StreamBuilder(
                            stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              }
                              DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];

                              // var userDocument = snapshot.data;
                              originalpricez=products["price"];
                              return  Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(products["price"],style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Spectral",

                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.white,
                                    decorationThickness: 2
                                ),
                                ),
                              );
                            }
                        ),

                        StreamBuilder(
                            stream: Firestore.instance.collection(path1x).document(path2x).collection(path3x).snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              }
                              DocumentSnapshot products = snapshot.data.documents[int.parse(path4x)];

                              //  var userDocument = snapshot.data;
                              // picture1[index] = userDocument["pic1"];
                              return   Container(
                                padding: EdgeInsets.only(left: 10),
                                margin: EdgeInsets.only(right: 25),

                                child: Text(products["offer"]+"%off",style: TextStyle(
                                  color: Colors.white,    fontFamily: "Spectral",

                                  fontWeight: FontWeight.w700,

                                ),
                                ),
                              );
                            }
                        ),
                        Icon(Icons.star,color: Colors.white,),
                        Text("4.5",style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Spectral",

                          fontWeight: FontWeight.w700,

                        ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("50 Reviews",style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Spectral",
                          fontWeight: FontWeight.w700,

                        ),
                        ),

                      ],
                    ),
                  ],
                )


            ),



                SizeQtyColorCard(),

                Center(
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 30.0, bottom: 15),
                    child: RaisedButton(
                      color:  Color(0xff0f4c81),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15),
                          side: BorderSide(color: Color(0xFFceced8))),
                      onPressed: () {
                         var qtyx=qty.text;
                        if(qtyx.isEmpty){
                          Fluttertoast.showToast(msg:"Select a quantity",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.teal,textColor: Colors.white);
                        }
                        else if(pic1==null || pic1==null || pic1==null || pic1==null){
                          Fluttertoast.showToast(msg:"Rendering. wait",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.teal,textColor: Colors.white);
                        }
                        else{
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => CheckoutPage(pic1: pic1,pic2: pic2,pic3: pic3,pic4: pic4,name1: name1,
                            name2: name2,oprice: originalpricez,fprice: finalpricez,offer: offer,username: mailx,qty: qtyx,)));
                        }

                      },
                      child: Text('Buy Now', style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Spectral",
                          fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),

              Center(
              child: Container(
                width: 300.0,
                height: 50.0,
                margin: EdgeInsets.only(top: 15.0, bottom: 20),
                child: RaisedButton(
                  color:  Color(0xff0f4c81),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15),
                      side: BorderSide(color: Color(0xFFceced8))),
                  onPressed: () async {
                    await pr.show();
                    pr =  ProgressDialog(context,type: ProgressDialogType.Download, isDismissible: false, showLogs: true);
                     var qtyx=qty.text;
                    if(  qtyx.isEmpty){
                      Fluttertoast.showToast(msg: "Select qty",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.teal,textColor: Colors.white);

                    }
                    else{
                      for(int i=0;i<11;i++){

                        final snapShot =  await Firestore.instance.collection(mailx).document("Cartinfo").collection("Cartx").document("a"+i.toString()).get();

                        if (snapShot.exists){
                          //it exists
                        }
                        else if(i==10){
                          Fluttertoast.showToast(msg: "Cart is full",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.teal,textColor: Colors.white);

                        }
                        else{
                          databaseReference.collection(mailx).document("Cartinfo").collection("Cartx").document("max").setData({
                            'length': i+1,

                          });
                          databaseReference.collection(mailx).document("Cartinfo").collection("Cartx").document("a"+i.toString()).setData({
                            "path1":path1x,
                            "path2":path2x,
                            "path3":path3x,
                            "path4":path4x,
                             "qty":qtyx,
                          });

                          Fluttertoast.showToast(msg: "Item Added successfully",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.teal,textColor: Colors.white);

                          break;
                        }

                      }
                    }
//            Navigator.of(context)
//                .push(MaterialPageRoute(builder: (context) => CheckoutPage()));
                    await pr.hide();

                  },
                  child: Text('Add to Cart', style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Spectral",
                      fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),

                AboutThisItem(),
                Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 5),

                  child:  Row(children: <Widget>[
                    Expanded(child: Text("ON NEXT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,
                        fontFamily: "Spectral",color: Color(0xff0f4c81)),),),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OfferAndTrend(path: "bestSelling",
                          mailx: mailx,header: "bestSelling",) ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("MORE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,
                              fontFamily: "Spectral",color: Color(0xff0f4c81)),),
                          Icon(Icons.navigate_next, color: Color(0xff0f4c81),size: 30,),
                        ],
                      ),
                    ),

                  ],),
                ),
                listhorizontal("bestSelling",mailx)
              ],
            ),
          ),
        )
    );
  }

}




class SizeQtyColorCard extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: new BorderRadius.circular(10)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 125,
             child: Column(

              //size column
              children: <Widget>[
                Text("Quantity",style: TextStyle(fontSize: 18,color: Colors.white,
                    fontWeight: FontWeight.w700,fontFamily: "Spectral"),),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        qty.text="0";
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 8,),

                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Icon(Icons.exposure_minus_1),
                      ),
                    ),
                    Container(
                      height:35,
                      width:40,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(10)),
                      margin: EdgeInsets.only(top: 15,bottom: 10,left: 10,right: 10),
                      alignment: Alignment.center,
                      child:   TextField(
                        controller: qty,
                        textAlign: TextAlign.center,
                        readOnly: true,

                        style: TextStyle(fontWeight: FontWeight.w700,fontFamily: "Spectral",fontSize: 20,color: Colors.black),
                        decoration: InputDecoration(border: InputBorder.none,),
                        //readOnly: true,
                      ),
                      // Text("S",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700,fontFamily: "Raleway"),),
                    ),
                    GestureDetector(
                      onTap: (){
                        qty.text="1";
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 8,),

                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Icon(Icons.plus_one),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10),
            width: 125,
            child: Column(

              //size column
              children: <Widget>[
                Text("Delivery time",style: TextStyle(fontSize: 18,color: Colors.white,
                    fontWeight: FontWeight.w700,fontFamily: "Spectral"),),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      child: Icon(Icons.timelapse_rounded,color: Colors.white,),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text("30-40 mins",style: TextStyle(fontSize: 18,color:Colors.white,
                          fontWeight: FontWeight.w700,fontFamily: "Spectral"),),
                    )
                  ],
                ),




              ],
            ),
          ),

        ],
      ),
    );
  }

}

 class listhorizontal extends StatelessWidget{
   String path1,usernamexx;


   listhorizontal(String s ,String username){
     path1 = s;
     usernamexx=username;

   }

   @override
   Widget build(BuildContext context) {
     // TODO: implement build


     return  Container(
       height: 280,
       // margin: EdgeInsets.only(bottom: 50),
       child: ListView.builder(
           itemCount: 8,
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           itemBuilder: (BuildContext ctxt, int index) {
             return GestureDetector(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsPage(path1: "Homepage",
                   path2: "SubHomepage",path3: path1,path4: index.toString(),mail: usernamexx,) ));


               },
               child: Container(
                 height: 280,
                 width: 176,
                 decoration: BoxDecoration(
                     color: Color(0xff0f4c81),
                     borderRadius: new BorderRadius.circular(10)
                 ),
                 margin: EdgeInsets.all(2),
                 child: Column(
                   children: <Widget>[
                     StreamBuilder(
                         stream: Firestore.instance.collection("Homepage").document('SubHomepage').collection(path1).snapshots(),
                         builder: (context, snapshot) {
                           if (!snapshot.hasData) {
                             return new Text("Loading");
                           }
                           DocumentSnapshot products = snapshot.data.documents[index];

                           // var userDocument = snapshot.data;
                           // picture1[index] = userDocument["pic1"];
                           return   Container(
                             height: 210,
                             width: 176,
                             child:  ClipRRect(
                               borderRadius: BorderRadius.circular(10),
                               child: Image.network(products["pic1"],

                                 fit: BoxFit.cover,
                               ) ,
                             ),
                           );
                         }
                     ),
                     StreamBuilder(
                         stream: Firestore.instance.collection("Homepage").document('SubHomepage').collection(path1).snapshots(),
                         builder: (context, snapshot) {
                           if (!snapshot.hasData) {
                             return new Text("Loading");
                           }
                           DocumentSnapshot products = snapshot.data.documents[index];

                           // var userDocument = snapshot.data;
                           // picture1[index] = userDocument["pic1"];
                           return   Container(
                             padding: EdgeInsets.only(left: 5),
                             child:  Text(products["name1"],maxLines: 1,style: TextStyle(
                               fontSize: 18,
                               fontFamily: "Raleway",
                               fontWeight: FontWeight.w700,
                               color: Colors.white,
                             ),
                             ),
                           );
                         }
                     ),
                     StreamBuilder(
                         stream: Firestore.instance.collection("Homepage").document('SubHomepage').collection(path1).snapshots(),
                         builder: (context, snapshot) {
                           if (!snapshot.hasData) {
                             return new Text("Loading");
                           }
                           DocumentSnapshot products = snapshot.data.documents[index];

                           //var userDocument = snapshot.data;
                           // picture1[index] = userDocument["pic1"];
                           return Container(
                             padding: EdgeInsets.only(left: 5),

                             child: Text(products["name2"],maxLines: 1,style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.w600 ,
                                 fontFamily: "Raleway",
                                 color: Colors.white
                             ),
                             ) ,
                           );
                         }
                     ),

                     Row(
                       children: <Widget>[
                         StreamBuilder(
                             stream: Firestore.instance.collection("Homepage").document('SubHomepage').collection(path1).snapshots(),
                             builder: (context, snapshot) {
                               if (!snapshot.hasData) {
                                 return new Text("Loading");
                               }
                               DocumentSnapshot products = snapshot.data.documents[index];

                               //  var userDocument = snapshot.data;
                               // picture1[index] = userDocument["pic1"];

                               var price =  int.parse(products["price"]);
                               assert(price is int);
                               var offer = int.parse(products["offer"]);
                               assert(offer is int);
                               var finalprice = (price*offer)/100;
                               var finalpricexx = price-finalprice;
                               var finalpricexxx=  finalpricexx.round();

                               return   Container(
                                 padding: EdgeInsets.only(left: 10),
                                 child: Text("₹"+finalpricexxx.toString(),style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.w700,

                                 ),
                                 ),
                               );
                             }
                         ),
                         StreamBuilder(
                             stream: Firestore.instance.collection("Homepage").document('SubHomepage').collection(path1).snapshots(),
                             builder: (context, snapshot) {
                               if (!snapshot.hasData) {
                                 return new Text("Loading");
                               }
                               DocumentSnapshot products = snapshot.data.documents[index];

                               // var userDocument = snapshot.data;

                               return     Container(
                                 padding: EdgeInsets.only(left: 10),
                                 child: Text(products["price"],style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.w700,
                                     decoration: TextDecoration.lineThrough,
                                     decorationColor: Colors.white,
                                     decorationThickness: 2
                                 ),
                                 ),
                               );
                             }
                         ),
                         StreamBuilder(
                             stream: Firestore.instance.collection("Homepage").document('SubHomepage').collection(path1).snapshots(),
                             builder: (context, snapshot) {
                               if (!snapshot.hasData) {
                                 return new Text("Loading");
                               }
                               DocumentSnapshot products = snapshot.data.documents[index];

                               //var userDocument = snapshot.data;
                               // picture1[index] = userDocument["pic1"];
                               return   Container(
                                 padding: EdgeInsets.only(left: 10),
                                 child: Text(products["offer"]+"%off",style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w700,

                                 ),
                                 ),
                               );
                             }
                         ),



                       ],
                     ),
                   ],
                 ),
               ),
             );
           }
       ),
     );
   }
 }

class AboutThisItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200 ,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: new BorderRadius.circular(10)),

      child: Text("About this Item",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
    );
  }

}
