import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../onboarding_screen.dart';


class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(

                  image: AssetImage("assets/abc.jpeg"), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x000), Color(0xffe46b10)])),
          child: Stack(

            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 65),
                  child: Text("Nature", style: TextStyle(fontWeight: FontWeight.w600,
                      fontFamily: "Spectral",fontSize: 30,color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 45,
                  margin: EdgeInsets.only(top: 70),
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(left: 80,top: 0),
                  child: Text("Store", style: TextStyle(fontWeight: FontWeight.w600,
                      fontFamily: "Spectral",fontSize: 35,color: Color(0xffe46b10)),
                  ),
                ),
              ),
              Positioned(
                right: 1,
                bottom: 20,
                 child: GestureDetector(
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OnboardingScreen()));
                   },
                   child: Container(
                    margin: EdgeInsets.only(top: 200),
                    decoration: BoxDecoration(
                        color:  Color(0xffe46b10),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    width: 60,
                    height: 60,
                    child:    Icon(Icons.arrow_forward_ios,color: Colors.white,),
                ),
                 ),
              ),
            ],
          ),
        ),
    );
  }
}
