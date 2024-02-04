import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:igapp/models/notificationmodel.dart';
import 'package:igapp/screens/StudentCouncilInfo.dart';
import 'package:igapp/screens/article_screen.dart';
import 'package:igapp/screens/idsScreen.dart';
import 'package:igapp/screens/ig_about_ig.dart';
import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/igenthu.dart';
import 'package:igapp/screens/igleader2.dart';
import 'package:igapp/screens/notification_screen.dart';
import 'package:igapp/screens/pic0ftheday.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  IgViewModel igViewModel =IgViewModel();

  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  late int initialNotificationLength ;
  late AsyncSnapshot<int> currentlength = AsyncSnapshot<int>.nothing();

  Future<void> loadInitialNotificationLength() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      initialNotificationLength =
          prefs.getInt('initialNotificationLength') ?? 0;
    });

  }
  void saveNotificationLength(int length) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('initialNotificationLength', length);
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    loadInitialNotificationLength();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<String> assetImages = [
      'deptlogos/ECE.png',
      'deptlogos/CME.png',
      'deptlogos/CIV.png',
      'deptlogos/CSE.png',
      'deptlogos/EE.png',
      'deptlogos/ARC.png',
      'deptlogos/MIN.png',
      'deptlogos/MME.png',
      'deptlogos/MECH.png',
      // Add more asset image paths as needed
    ];
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(

          title: Text("अद्वैतम्",style: TextStyle(color: Colors.white,fontSize:height*0.03),),


          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FutureBuilder<notificationmodel>(
                future: igViewModel.fetchIgnotificationApi(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  IconButton(
                        icon: Icon(Icons.notifications_none,
                          color: Colors.white,),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>IgNotificationScreen()));
                        }
                    );
                  }
                  else if (snapshot.hasData) {
                    int currentLength = snapshot.data!.notifications!.length;
                    int previousLength = initialNotificationLength;

                    if (currentLength > previousLength) {
                      saveNotificationLength(currentLength);
                      return IconButton(
                        //diff icon button
                        icon: Icon(Icons.notifications_active,
                          color: Colors.redAccent,),
                        onPressed: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                      );
                    }
                    else {
                      return IconButton(
                        icon: Icon(Icons.notifications_none,color: Colors.white,),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>IgNotificationScreen()));

                        },
                      );
                    }
                  }
                  else {
                   return IconButton(
                        icon: Icon(Icons.notifications_none,
                        color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>IgNotificationScreen()));

                  });
                  }
                },
              ),
            )


          ]
      ),

      extendBody: true,
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
          Navigator.push(context,
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
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>HomeScreen3()));
                },
                color: Color(0xFF82AC57)
            ),

            IconButton(
              icon: Icon(Icons.calendar_month ,size: height*0.05),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>IgScheduleScreen()));
              },
              color:Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.groups,size: height*0.05,),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>StudentCouncilinfo()));
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.code,size: height*0.05),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>IdsScreen()));
              },
              color: Colors.white,
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
        Container(
        height: height*0.1,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: assetImages.length, // Number of stories
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.all(width*0.03),
                child: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(height*0.9),

                  ),
                  child: Image.asset(assetImages[index]),
                ),
              );
            }),
      ),
          Padding(
            padding:  EdgeInsets.only(top:height*0.03,bottom: height*0.02,left: width*0.06 ),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text("Sneak Peaks",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>IgEnthuScreen()));

                },
                child: Container(
                  height: height*0.15,
                  width: width*0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.02),
                    border: Border.all(
                      color: Color(0xFF82AC57) ,
                      width: width*0.006,
                    ),
                  ),
                  child: Center(
                    child: ClipRRect(

                      borderRadius: BorderRadius.circular(height * 0.02),

                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.only(top: height*0.025),
                          child: Column(
                            children: [
                              Container(
                                height: height*0.05,
                                  child: Image.asset('NavigationBaritems/star.png')),
                              Text("Enthu Board",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>IgScheduleScreen()));
                },
                child: Container(
                  height: height*0.15,
                  width: width*0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.02),
                    border: Border.all(
                      color: Color(0xFF82AC57) , // Set border color
                      width: width*0.006, // Set border width
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(height * 0.04),
                    child: Padding(
                      padding:  EdgeInsets.only(top: height*0.03),
                      child: Column(
                        children: [
                          Icon(Icons.calendar_month,color: Color(0xFFC1FF82),size: height*0.05,),
                          Text("Schedule",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(top:height*0.01,bottom: height*0.02,left: width*0.06 ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Gallery",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),),),
          ),
          Padding(
            padding: EdgeInsets.only(bottom:height*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                onTap: (){
                    Navigator.push(context,
                       MaterialPageRoute(builder: (context) =>IgArticleScreen()));
          },
                  child: Container(
                    height: height*0.18,
                    width: width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.02),
                      border: Border.all(
                        color: Color(0xFF82AC57) ,
                        width: width*0.006,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(height * 0.04),
                      child: Padding(
                        padding:  EdgeInsets.only(top: height*0.02),
                        child: Column(
                          children: [
                            Icon(Icons.note_outlined,color: Color(0xFFC1FF82),size: height*0.05,),
                            Text("Article of",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),),
                            Text("the day",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Picoftheday()));
                  },

                  child: Container(
                    height: height*0.18,
                    width: width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.02),
                      border: Border.all(
                        color: Color(0xFF82AC57) , // Set border color
                        width: width*0.006, // Set border width
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(height * 0.04),
                      child: Padding(
                        padding:  EdgeInsets.only(top: height*0.02),
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt,color: Color(0xFFC1FF82),size: height*0.05,),
                            Text("Pic of",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),),
                            Text("the day",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height*0.15,
                  width: width*0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.02),
                    border: Border.all(
                      color: Color(0xFF82AC57) ,
                      width: width*0.006,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(height * 0.02),
                    child: Padding(
                      padding:  EdgeInsets.only(top: height*0.02),
                      child: Column(
                        children: [
                          Icon(Icons.book,color: Color(0xFFC1FF82),size: height*0.05,),
                          Text("RuleBook",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600),),

                        ],
                      ),
                    ),

                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>AboutIG()));
                  },
                  child: Container(
                    height: height*0.15,
                    width: width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.02),
                      border: Border.all(
                        color: Color(0xFF82AC57) , // Set border color
                        width: width*0.006, // Set border width
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(height * 0.04),
                      child: Padding(
                        padding:  EdgeInsets.only(top: height*0.02),
                        child: Column(
                          children: [
                            Icon(Icons.info, color: Color(0xFFC1FF82),size: height*0.05,),
                            Text("About Ig",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600)),

                          ],
                        ),
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),

      ]
      ),
    );
  }
}
