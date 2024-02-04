import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:igapp/screens/StudentCouncilInfo.dart';
import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/igleader2.dart';
class IdsScreen extends StatelessWidget {
  const IdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(top: height*0.006),
          child: IconButton(
            icon: Icon(
              Icons.arrow_left,
              color: Color(0xFF82AC57),
              size: height * 0.065,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.black87,
        title:Padding(
            padding: EdgeInsets.only(top: height*0.03),
            child: Text("About IDS" ,
              style: GoogleFonts.roboto(color: Colors.white,fontSize: height*0.029,fontWeight: FontWeight.w700),)),
        centerTitle: true,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(


        shape:const CircleBorder(
            side: BorderSide(width: 3,
              color: Colors.white,)
        ),

        child: ClipRRect(
            borderRadius:BorderRadius.circular(width*0.07) ,
            child: CircleAvatar(
                radius: width*0.06,
                child: Image.asset('NavigationBaritems/podium.png'))),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>IgLeaderScreen()));

        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: height*0.1,
        color:  Color(0xFF262626),
        shape: const CircularNotchedRectangle(),
        notchMargin: 0,

        clipBehavior: Clip.hardEdge,
        child: new Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(

              icon: Icon(Icons.home ,size: height*0.05,),

              onPressed: () => Navigator.of(context).pop(),
              color:  Colors.white,
            ),

            IconButton(
              icon: Icon(Icons.calendar_month ,size: height*0.05),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>IgScheduleScreen()));
              },
              color:Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.groups,size: height*0.05,),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>StudentCouncilinfo()));
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.code,size: height*0.05),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>IdsScreen()));
              },
                color: Color(0xFF82AC57),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: height*0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
             Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height*0.05),
                    child: SizedBox(
                      height: height*0.5,
                      width: width*0.97,
                      child: SingleChildScrollView(
                        child: Card(


                          child: Padding(
                            padding: EdgeInsets.only(top: height*0.08,left: width*0.01,right: width*0.01),
                            child: Text(
                              "The Institute Development Society at VNIT Nagpur is a student organization focused on promoting Web Development, Android Development Blockchain technology , Competitive programming and UI/UX. IDS's primary aim is to prepare its members for Hackathons and cultivate a coding culture at VNIT Nagpur. Through workshops, seminars, coding challenges, and collaborative projects, IDS equips its members with Practical  skills for success in these dynamic tech fields. Serving as a bridge between  academics and industry requirements, IDS ensures students are well-prepared for tech careers.",
                              maxLines: 22,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(color: Colors.white,
                                  fontSize: height*0.015
                              )),
                          ),


                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color:  Color(0xFF82AC57), // Set the desired border color here
                              width: width*0.002, // Set the desired border width here
                            ),

                            borderRadius: BorderRadius.circular(width*0.05),

                          ),
                          color: Colors.black,
                          margin: EdgeInsets.all(
                            16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width:width*0.45,
                    height: height*0.15,


                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.transparent,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('deptlogos/ids333-removebg-preview.png',),

                    ),
                  )
                ],
              ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:width*0.06,vertical: height*0.005),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Developed By',
                style: GoogleFonts.roboto(fontSize: height*0.02,color: Colors.white),
              ),
            ),
          ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Padding(
                      padding:  EdgeInsets.only(left: width*0.06),
                      child: Container(
                      width: width * 0.5,
                      height: height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.02),
                        border: Border.all(
                          color: Color(0xFF82AC57),
                          width: width * 0.002,
                        )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(width*0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(

                                child: Image.asset('developersPhoto/bhushanbahale.jpg'),
                            height: height*0.2,
                            width: width*0.7,),

                            Padding(
                              padding:  EdgeInsets.only(top:height*0.007),
                              child: Text(
                                'BHUSHAN BAHALE',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: height * 0.01,
                                    fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                    ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.06),
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.01),
                              border: Border.all(
                                color: Color(0xFF82AC57),
                                width: width * 0.002,
                              )
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(width*0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset('NavigationBaritems/bhupendra.png'),
                                  height: height*0.2,
                                  width: width*0.7,),

                                Padding(
                                  padding:  EdgeInsets.only(top:height*0.007),
                                  child: Text(

                                    'BHUPENDRA TIWARI',
                                    style: GoogleFonts.roboto(

                                      color: Colors.white,
                                      fontSize: height * 0.01,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.06),
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              border: Border.all(
                                color: Color(0xFF82AC57),
                                width: width * 0.002,
                              )
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(width*0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(

                                  child: Image.asset('NavigationBaritems/deepak.png'),

                                  height: height*0.2,
                                  width: width*0.7,),

                                Padding(
                                  padding:  EdgeInsets.only(top:height*0.007),
                                  child: Text(

                                    'DEEPAK JALAN',
                                    style: GoogleFonts.roboto(

                                        color: Colors.white,
                                        fontSize: height * 0.01,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.06),
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              border: Border.all(
                                color: Color(0xFF82AC57),
                                width: width * 0.002,
                              )
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(width*0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(

                                  child: Image.asset('developersPhoto/harshada1.jpg'),

                                  height: height*0.2,
                                  width: width*0.7,),

                                Padding(
                                  padding:  EdgeInsets.only(top:height*0.007),
                                  child: Text(

                                    'HARSHADA POLSHETTY',
                                    style: GoogleFonts.roboto(

                                      color: Colors.white,
                                      fontSize: height * 0.01,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),



              ]
        )
                )
              ),




            ]

          ),
        ),
      ),
    );
  }
}
