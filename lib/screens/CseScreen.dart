import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/screens/IgInformation.dart';
import 'package:igapp/models/ig_leader_model.dart';

import '../models/ig_enthu_model.dart';
import '../view_model/ig_view_model.dart';
class CseScreen extends StatefulWidget {
  const CseScreen({super.key});

  @override
  State<CseScreen> createState() => _CseScreenState();
}

class _CseScreenState extends State<CseScreen> {
  late Future<igleadermodel> leaderModelFuture2;
  late Future<igmodel> leaderModelFuture;
  IgViewModel igViewModel = IgViewModel();


  bool isDataFetched = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leaderModelFuture2 = igViewModel.fetchIgleaderApi()  ;
    leaderModelFuture =igViewModel.fetchIgApi();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height*0.09),
                child: Container(
                  height: height*0.3,
                  width: width*0.97,
                  // color: Color(0xFF262626),,
                  child: Card(


                    child: Padding(
                      padding: EdgeInsets.only(top: height*0.06,left: width*0.03,bottom: height*0.05),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Mascot:",style: TextStyle(color:  Color(0xFF82AC57)),),
                              Text(eventsData['CSE'].toString() ,style: TextStyle(color:  Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("StagePlay :",style: TextStyle(color:  Color(0xFF82AC57))),
                              Text(stagePlayData['CSE'].toString(),style: TextStyle(color:  Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("StreetPlay :",style: TextStyle(color:  Color(0xFF82AC57))),
                              Text(streetPlayData['CSE'].toString(),style: TextStyle(color:  Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Campus Decor :",style: TextStyle(color:  Color(0xFF82AC57))),
                              Text(campusDecorData['CSE'].toString(),style: TextStyle(color:  Colors.white)),
                            ],
                          ),
                        ],
                      ),
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
              Container(
                width:width*0.45,
                height: height*0.15,


                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.transparent,
                ),
                child: CircleAvatar(
                  radius: width*0.3,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('deptlogos/CSE.png',),

                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Text("Scores",
              style: TextStyle(
                  color: Colors.white ,fontSize: height*0.03),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder<igmodel>(
                  future: leaderModelFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitCircle(
                          size: 50,
                          color: Colors.cyanAccent,
                        ),
                      );
                    }
                    else if (snapshot.data == null ||
                        snapshot.data.points == null) {
                      return Center(
                        child: Text(
                          'No Data Available :-( Try after 24 Hours',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }
                    return Container(
                      height: height * 0.15,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            height * 0.02),
                        border: Border.all(
                          color: Color(0xFF82AC57),
                          width: width * 0.006,
                        ),
                      ),
                      child: Center(
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(
                              height * 0.02),

                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.02),
                              child: Column(
                                children: [
                                  Container(
                                      height: height * 0.05,
                                      child: Image.asset(
                                          'NavigationBaritems/star.png')),
                                  Text("Enthu Board",
                                    style: TextStyle(
                                        color: Colors.white),),
                                  Text(
                                    snapshot.points.cSE.toString(),
                                    style: TextStyle(
                                        color: Colors.white),)

                                ],
                              ),
                            ),
                          ),

                        ),
                      ),
                    );
                  }
              ),
              FutureBuilder<igleadermodel>(
                  future: leaderModelFuture2,
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitCircle(
                          size: 50,
                          color: Colors.cyanAccent,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      lcseval1 = lcseval;
                    } else if (snapshot.data == null ||
                        snapshot.data.points == null) {
                      return Center(
                        child: Text(
                          'No Data Available :-( Try after 24 Hours',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    } else {
                      lcsep = snapshot.data.points.cSE ?? lcsep;
                      EsaveCseToSharedPreferences(lcsep);
                      if (!isDataFetched &&
                          (lcseval.connectionState ==
                              ConnectionState.none ||
                              lcseval.connectionState ==
                                  ConnectionState.waiting)) {
                        // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                        EgetCseFromSharedPreferences().then((
                            value) {
                          setState(() {
                            lcseval = AsyncSnapshot<
                                int>.withData(
                              ConnectionState.done,
                              value ??
                                  lcsep, // Provide a default value if null
                            );
                            isDataFetched = true;
                          });
                        });
                      }
                    }
                    return Container(
                      height: height * 0.15,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            height * 0.02),
                        border: Border.all(
                          color: Color(0xFF82AC57),
                          width: width * 0.006,
                        ),
                      ),
                      child: Center(
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(
                              height * 0.02),

                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.02),
                              child: Column(
                                children: [
                                  Container(
                                      height: height * 0.05,
                                      child: Image.asset(
                                          'NavigationBaritems/podium.png')),
                                  Text("Leaderboard Points",
                                    style: TextStyle(
                                        color: Colors.white),),
                                  Text(lcseval.data.toString() ??
                                      lcseval1.data.toString(),
                                    style: TextStyle(
                                        color: Colors.white ,fontSize: height*0.03,fontWeight: FontWeight.bold),)

                                ]
                              ),
                            ),
                          ),

                        ),
                      ),
                    );
                  }
              ),
            ],
          )



        ],


      ),
    );
  }
}
