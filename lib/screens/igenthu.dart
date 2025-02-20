import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/DeptScreens/ArchiScreen.dart';
import 'package:igapp/DeptScreens/CivilScreen.dart';
import 'package:igapp/DeptScreens/CseScreen.dart';
import '../SharedPreferences/SpFunctionsForEnthuBoard.dart';
import '../SharedPreferences/SpFunctionsForLeaderB.dart';
import '../models/ig_enthu_model.dart';
import '../view_model/ig_view_model.dart';
import 'package:igapp/screens/igleader2.dart';
import 'package:igapp/DeptScreens/ChemicalScreen.dart';
import 'package:igapp/DeptScreens/EceScreen.dart';
import 'package:igapp/DeptScreens/EeeScreen.dart';
import 'package:igapp/DeptScreens/MechScreen.dart';
import 'package:igapp/DeptScreens/MetaScreen.dart';

import 'package:igapp/screens/StudentCouncilInfo.dart';

import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/idsScreen.dart';

class IgEnthuScreen extends StatefulWidget {
  const IgEnthuScreen({super.key});

  @override
  State<IgEnthuScreen> createState() => _IgEnthuScreenState();
}

class _IgEnthuScreenState extends State<IgEnthuScreen> {
  late Future<igmodel> leaderModelFuture;

  bool isDataFetched = false;

  late AsyncSnapshot<int> cseval1 = AsyncSnapshot<int>.nothing();
  late AsyncSnapshot<int> mechval1 = AsyncSnapshot<int>.nothing();
  late AsyncSnapshot<int> eceval1 = AsyncSnapshot<int>.nothing();
  late AsyncSnapshot<int> civval1 = AsyncSnapshot<int>.nothing();
  late AsyncSnapshot<int> chemminval1 = AsyncSnapshot<int>.nothing();
  late AsyncSnapshot<int> eeeval1 = AsyncSnapshot<int>.nothing();
  late AsyncSnapshot<int> metaval1 = AsyncSnapshot<int>.nothing();
  late AsyncSnapshot<int> archival1 = AsyncSnapshot<int>.nothing();
  late int csep;
  late AsyncSnapshot<int> cseval = AsyncSnapshot<int>.nothing();
  late int mechp;
  late AsyncSnapshot<int> mechval = AsyncSnapshot<int>.nothing();
  late int civp;
  late AsyncSnapshot<int> civval = AsyncSnapshot<int>.nothing();
  late int metap;
  late AsyncSnapshot<int> metaval = AsyncSnapshot<int>.nothing();
  late int chemminp;
  late AsyncSnapshot<int> chemminval = AsyncSnapshot<int>.nothing();
  late int archip;
  late AsyncSnapshot<int> archival = AsyncSnapshot<int>.nothing();
  late int ecep;
  late AsyncSnapshot<int> eceval = AsyncSnapshot<int>.nothing();
  late int eeep;
  late AsyncSnapshot<int> eeeval = AsyncSnapshot<int>.nothing();

  IgViewModel igViewModel = IgViewModel();
  Future<void> _refreshdaTa() async {
    await igViewModel.fetchIgApi();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leaderModelFuture = igViewModel.fetchIgApi();
    EgetCseFromSharedPreferences().then((value) {
      setState(() {
        cseval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? csep, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetMechFromSharedPreferences().then((value) {
      setState(() {
        mechval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? mechp, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetMetaFromSharedPreferences().then((value) {
      setState(() {
        metaval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? metap, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetChemminFromSharedPreferences().then((value) {
      setState(() {
        chemminval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? chemminp, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetCivFromSharedPreferences().then((value) {
      setState(() {
        civval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? civp, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetArchiFromSharedPreferences().then((value) {
      setState(() {
        archival = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? archip, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetEceFromSharedPreferences().then((value) {
      setState(() {
        eceval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? ecep, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetEeeFromSharedPreferences().then((value) {
      setState(() {
        eeeval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? eeep, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left,
            color: Color(0xFF82AC57),
              size: height * 0.05
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ENTHU POINTS",
              style: GoogleFonts.roboto(color: Colors.white, fontSize: height * 0.02,fontWeight: FontWeight.w700),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _refreshdaTa,
                icon:  Icon(Icons.refresh,size: height*0.04,),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(


        shape:const CircleBorder(
            side: BorderSide(width: 4,
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
              icon: Icon(Icons.groups,size: height*0.05),
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
              color: Colors.white,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric( vertical: height * 0.01),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<igmodel>(
                future: leaderModelFuture,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.green,
                      ),
                    );
                  }
                  else if (snapshot.hasError) {
                    cseval1 = cseval;
                    mechval1 = mechval;
                    eceval1 = eceval;
                    civval1 = civval;
                    chemminval1 = chemminval;
                    eeeval1 = eeeval;
                    metaval1 = metaval;
                    archival1 = archival;
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
                  else {
                    csep = snapshot.data.points.cSE ?? csep;
                    mechp = snapshot.data.points.mECH ?? mechp;
                    chemminp = snapshot.data.points.cHEMMIN ?? chemminp;
                    archip = snapshot.data.points.aRCHI ?? archip;
                    metap = snapshot.data.points.mETA ?? metap;
                    ecep = snapshot.data.points.eCE ?? ecep;
                    eeep = snapshot.data.points.eEE ?? eeep;
                    civp = snapshot.data.points.cIVIL ?? civp;

                    EsaveCseToSharedPreferences(csep);
                    EsaveArchiToSharedPreferences(archip);
                    EsaveChemminToSharedPreferences(chemminp);
                    EsaveCivToSharedPreferences(civp);
                    EsaveEceToSharedPreferences(ecep);
                    EsaveEeeToSharedPreferences(eeep);
                    EsaveMechToSharedPreferences(mechp);
                    EsaveMetaToSharedPreferences(metap);

                    if (!isDataFetched &&
                        (cseval.connectionState == ConnectionState.none ||
                            cseval.connectionState == ConnectionState.waiting)) {
                      EgetCseFromSharedPreferences().then((value) {
                        setState(() {
                          cseval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? csep, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (mechval.connectionState == ConnectionState.none ||
                            mechval.connectionState == ConnectionState.waiting)) {
                      EgetMechFromSharedPreferences().then((value) {
                        setState(() {
                          mechval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? mechp, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }

                    if (!isDataFetched &&
                        (civval.connectionState == ConnectionState.none ||
                            civval.connectionState == ConnectionState.waiting)) {
                      getCivFromSharedPreferences().then((value) {
                        setState(() {
                          civval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? civp, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (chemminval.connectionState == ConnectionState.none ||
                            chemminval.connectionState ==
                                ConnectionState.waiting)) {
                      EgetChemminFromSharedPreferences().then((value) {
                        setState(() {
                          chemminval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? chemminp,
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (eceval.connectionState == ConnectionState.none ||
                            eceval.connectionState == ConnectionState.waiting)) {
                      EgetEceFromSharedPreferences().then((value) {
                        setState(() {
                          eceval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? ecep, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (eeeval.connectionState == ConnectionState.none ||
                            eeeval.connectionState == ConnectionState.waiting)) {
                      EgetEeeFromSharedPreferences().then((value) {
                        setState(() {
                          eeeval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? eeep, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (archival.connectionState == ConnectionState.none ||
                            archival.connectionState ==
                                ConnectionState.waiting)) {
                      EgetArchiFromSharedPreferences().then((value) {
                        setState(() {
                          archival = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? archip,
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (metaval.connectionState == ConnectionState.none ||
                            metaval.connectionState == ConnectionState.waiting)) {
                      EgetMetaFromSharedPreferences().then((value) {
                        setState(() {
                          metaval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? metap,
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                  }
                  List<Map<String, dynamic>> departmentData = [
                    {'name': 'CSE', 'points': cseval.data ?? cseval1.data ?? 0},
                    {'name': 'MECH', 'points': mechval.data ?? mechval1.data ?? 0},
                    {'name': 'CIVIL', 'points': civval.data ?? civval1.data ?? 0},
                    {'name': 'META', 'points': metaval.data ?? metaval1.data ?? 0},
                    {'name': 'CHEM-MIN', 'points': chemminval.data ?? chemminval1.data ?? 0},
                    {'name': 'ARCHI', 'points': archival.data ?? archival1.data ?? 0},
                    {'name': 'ECE', 'points': eceval.data ?? eceval1.data ?? 0},
                    {'name': 'EEE', 'points': eeeval.data ?? eeeval1.data ?? 0},
                  ];
                  departmentData.sort((a, b) => b['points'].compareTo(a['points']));

                  List<String> departmentNames = departmentData.map((data) => data['name'] as String).toList();
                  List<String> pointList = departmentData.map((data) => data['points'].toString()).toList();

                  return Padding(
                    padding: EdgeInsets.symmetric( horizontal: width*0.04, vertical: height * 0.020),
                    child: ListView.builder(
                      itemCount: departmentNames.length,
                      itemBuilder: (context, index) {
                        String departmentName = departmentNames[index];
                        String points = pointList[index];

                        return InkWell(
                          onTap: (){
                            if(departmentName=='CSE')
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CseScreen()));
                              }
                            else if(departmentName=='ECE')
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EceScreen()));
                            }
                            else if(departmentName=='MECH')
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MechScreen()));
                            }
                            else if(departmentName=='CIVIL')
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CivilScreen()));
                            }
                            else if(departmentName=='META')
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MetaScreen()));
                            }
                            else if(departmentName=='CHEM-MIN')
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Chemical()));
                            }
                            else if(departmentName=='ARCHI')
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ArchiScreen()));
                            }
                            else if(departmentName=='EEE')
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EeeScreen()));
                            }
                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*.040,vertical: height*0.01),
                            child: Container(
                              height: height*0.070,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: index + 1 == 1 ? Colors.white: Color.fromRGBO(107, 230, 76, 0.60),

                                ),
                                color: index + 1 == 1 ? Color(0xFF82AC57) :index + 1 == 2 ? Color.fromRGBO(107, 230, 76, 0.30) : Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(width*0.03)),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: height*0.0075,horizontal: width*0.02),
                                    child: Container(
                                      width: width*0.10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular((width*0.2)),
                                        color: index + 1 == 1 ? Colors.white: Color(0xFF82AC57),
                                      ),
                                      child: Center(
                                        child: Text(
                                          (index+1).toString(),
                                          style: GoogleFonts.roboto(
                                              color: index + 1 == 1 ? Colors.black87: Colors.white,
                                              fontSize: height*0.03,
                                              fontWeight: FontWeight.w700
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: height*0.0078,horizontal: width*0.02),
                                    child: SizedBox(
                                      width: width*0.3,

                                      child: Text(
                                        departmentName,
                                        style: GoogleFonts.roboto(
                                            color: index + 1 == 1 ? Colors.black87: Colors.white,
                                            fontSize: height*0.02,
                                            fontWeight: FontWeight.w700
                                        ),

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: height*0.0078,horizontal: width*0.01),
                                    child: SizedBox(
                                      width: width*0.3,

                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          points,
                                          style: GoogleFonts.roboto(
                                              color: index + 1 == 1 ? Colors.black87: Colors.white,
                                              fontSize: height*0.02,
                                              fontWeight: FontWeight.w700
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ),
                        );
                      },),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
