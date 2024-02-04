import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'HomeScreen3.dart';
class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {


  late Widget displayedWidget;
  late Timer timer;
  late Timer go;

  @override
  void initState() {
    super.initState();
    displayedWidget = Container();
    // Initial empty container
    // After 2 seconds, change the displayed widget
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        displayedWidget = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03),
              child: Text("INSTITUTE",style: GoogleFonts.prozaLibre(fontSize:MediaQuery.of(context).size.height*0.03,color: Colors.white)),
            ),
            Text("GATHERING 24'",style: GoogleFonts.prozaLibre(fontSize:MediaQuery.of(context).size.height*0.03,color: Colors.white)),

            Padding(
              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Developed by",style: GoogleFonts.prozaLibre(fontSize:MediaQuery.of(context).size.height*0.015,color: Colors.amberAccent,fontWeight: FontWeight.w700),),
                          CircleAvatar(
                            backgroundImage: AssetImage('deptlogos/ids333-removebg-preview.png'),
                            backgroundColor: Colors.black,
                            radius: MediaQuery.of(context).size.height*0.07,
                          )
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),




          ],

        );
      });
    });

    go= Timer(Duration(seconds: 3),(){
      setState(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>HomeScreen3(),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          Container(height: height*0.2,),
          Center(
            child: Text("अद्वैतम्",style: TextStyle(fontSize: height*0.1,color: Colors.white),),
          ),
          displayedWidget,
        ],
      )
    );
  }
}
