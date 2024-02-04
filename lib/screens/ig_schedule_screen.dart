import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:igapp/screens/StudentCouncilInfo.dart';
import 'package:igapp/screens/idsScreen.dart';
import 'package:igapp/screens/igleader2.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import '../models/schedule.dart';

String name = "01-03-2024";
String dept = '';
class IgScheduleScreen extends StatefulWidget {
  const IgScheduleScreen({super.key});

  @override
  State<IgScheduleScreen> createState() => _IgScheduleScreenState();
}

enum FilterList {
  zerothday,
  firstday,
  secondday,
  thirdday,
  fourth,
  fifth,
  sixth,
  seventh,
  eigth,
}

class _IgScheduleScreenState extends State<IgScheduleScreen> {
  IgViewModel igViewModel = new IgViewModel();
  FilterList? selectedMenu;

  final format = DateFormat('dd/MM/yy');

  Future<void> _refreshData(String data) async {
    await igViewModel.fetchIgscheduleApi(data);
    setState(() {
      name = data; // Update the name variable after fetching data
    });
  }
  Future<void> _refreshdata(String data,String d) async {
    await igViewModel.fetchIgsheduleApi(data,dept);
    print(data);
    print(dept);
    setState(() {
      name = data;
      dept = d; // Update the name variable after fetching data
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    Color myColor = Color(0xFF82AC57);

    void onButtonClicked(String date) {
        _refreshData(date);
    }
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Padding(
          padding:  EdgeInsets.only(top: height*0.01),
          child: IconButton(
            icon: Icon(
              Icons.arrow_left,
              color: Color(0xFF82AC57),
              size: height * 0.06,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Padding(
          padding:  EdgeInsets.only(top: height*0.037),
          child: Text(
            "SCHEDULE",
            style: GoogleFonts.roboto(color: Colors.white, fontSize: height * 0.029,fontWeight: FontWeight.w700),
          ),
        ),
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
                color: Color(0xFF82AC57),
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
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                color: Colors.white,
                height: height * 0.001,
              ),
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.006,vertical: height*0.008),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.symmetric(vertical: 4),
                          child: Text(
                            DateFormat.d().format(DateTime.now()),
                            style: GoogleFonts.prozaLibre(
                                fontSize: height * 0.03, color: myColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.EEEE().format(DateTime.now()),
                                style:  GoogleFonts.prozaLibre(
                                    fontSize: height * 0.016, color: Colors.white),
                              ),
                              Text(
                                DateFormat('MMMM yyyy').format(DateTime.now()),
                                style:  GoogleFonts.prozaLibre(
                                    fontSize: height * 0.016, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.002),
                          child: DropdownButton<FilterList>(
                            value: selectedMenu,
                            hint: Text(
                              'Department',
                              style: GoogleFonts.roboto(color: Colors.white),
                            ),
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),
                            dropdownColor: Colors.green,
                            onChanged: (FilterList? newValue) {
                              setState(() {
                                selectedMenu = newValue;
                                if (newValue != null) {
                                  // Handle the selected item
                                  if (FilterList.zerothday == newValue) {
                                    dept = 'ECE';
                                    _refreshdata(name, dept);
                                  } else if (FilterList.firstday == newValue) {
                                    dept = 'CSE';
                                    _refreshdata(name, dept);
                                  } else if (FilterList.secondday == newValue) {
                                    dept = '';
                                    _refreshdata(name, dept);
                                  } else if (FilterList.thirdday == newValue) {
                                    dept = 'CHEMMIN';
                                    _refreshdata(name, dept);
                                  } else if (FilterList.fourth == newValue) {
                                    dept = 'META';
                                    _refreshdata(name, dept);
                                  } else if (FilterList.fifth == newValue) {
                                    dept = 'ARCHI';
                                    _refreshdata(name, dept);
                                  } else if (FilterList.sixth == newValue) {
                                    dept = 'EEE';
                                    _refreshdata(name, dept);
                                  } else if (FilterList.seventh == newValue) {
                                    dept = 'CIVIL';
                                    _refreshdata(name, dept);
                                  } else if (FilterList.eigth == newValue) {
                                    dept = 'MECH';
                                    _refreshdata(name, dept);
                                  }
                                }
                              });
                            },
                            items: <DropdownMenuItem<FilterList>>[
                              DropdownMenuItem<FilterList>(
                                value: FilterList.secondday,
                                child: Text('ALL',
                                style: GoogleFonts.roboto(),),
                              ),
                              DropdownMenuItem<FilterList>(
                                value: FilterList.zerothday,
                                child: Text('ECE',
                                  style: GoogleFonts.roboto(),),
                              ),
                              DropdownMenuItem<FilterList>(
                                value: FilterList.thirdday,
                                child: Text('CHEM-MIN',
                                  style: GoogleFonts.roboto(),),
                              ),
                              DropdownMenuItem<FilterList>(
                                value: FilterList.fourth,
                                child: Text('META',
                                  style: GoogleFonts.roboto(),),
                              ),
                              DropdownMenuItem<FilterList>(
                                value: FilterList.fifth,
                                child: Text('ARCHI',
                                  style: GoogleFonts.roboto(),),
                              ),
                              DropdownMenuItem<FilterList>(
                                value: FilterList.sixth,
                                child: Text('EEE',
                                  style: GoogleFonts.roboto(),),
                              ),
                              DropdownMenuItem<FilterList>(
                                value: FilterList.seventh,
                                child: Text('CIVIL',
                                  style: GoogleFonts.roboto(),),
                              ),
                              DropdownMenuItem<FilterList>(
                                value: FilterList.eigth,
                                child: Text('MECH',
                                  style: GoogleFonts.roboto(),),
                              ),
                              DropdownMenuItem<FilterList>(
                                value: FilterList.firstday,
                                child: Text('CSE',
                                  style: GoogleFonts.roboto(),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: height * 0.001,
            ),
            Padding(
              padding:  EdgeInsets.only(left: width*.04),
              child: Container(
                color: Colors.black,
                height: height * 0.09,
                child: ButtonSelection(onButtonClicked: onButtonClicked),
              ),
            ),
            Container(
              color: Colors.white,
              height: height * 0.001,
            ),
            Container(
              height: height * 0.055,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(11)),
              child: Row(
                children: [
                  Container(
                    height: height*0.6,
                    width: width * 0.255,
                    child: Center(
                      child: Text(
                        'Time',
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: width * 0.05),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: height*0.6,
                    width: width*0.0051,
                  ),
                  Container(
                    height: height*0.6,
                    width: width * 0.70,
                    child: Center(
                      child: Text(
                        'Event',
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: width * 0.05),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: height * 0.001,
            ),
            Column(
              children: [
                SizedBox(
                  height: height*0.53,
                  width: width,
                  child: FutureBuilder<schedulemodel>(
                    future: igViewModel.fetchIgsheduleApi(name,dept),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: SpinKitCircle(
                            size: height * 0.07,
                            color: Colors.blue,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.schedules!.length,

                            itemBuilder: (context, index) {
                              //DateTime dateTime = DateTime.parse(snapshot.data!.schedules![index].date.toString());
                              if(snapshot.data!.schedules!.length==0)
                                {
                                  return Container(
                                    child: Center(
                                        child:  Text(
                                          'Comming Soon',
                                          style: GoogleFonts.roboto(
                                              fontSize: height*0.3
                                          ),
                                        )
                                    ),
                                  );
                                }
                             else if (snapshot.data!.schedules![index].time
                                      .toString() !=
                                  "null") {
                                return Container(
                                  height: height*0.20,
                                  decoration:  BoxDecoration(
                                    color: Colors.black87,

                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(top: height*0.003),
                                        child: SizedBox(
                                          width: width*0.255,
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: width*0.02,bottom: height*0.1),
                                            child: Text(
                                              snapshot
                                                  .data!
                                                  .schedules![index]
                                                  .time
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              style:
                                              GoogleFonts.prozaLibre(
                                                  fontSize: height*0.015,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color: myColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            height: height*0.20,
                                            width: width*0.0051,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: height*0.012,horizontal: width*0.05),
                                        child: Container(
                                          width: width*0.62,
                                          height: height*0.2,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(7),
                                            boxShadow: [BoxShadow(
                                              color: Color(0xFF82AC57),
                                              blurRadius: 5.0,
                                            ),]
                                          ),
                                          child: SingleChildScrollView(
                                            child: Card(
                                              color:  Colors.black87,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Padding(
                                                    padding:  EdgeInsets.only(left: width*0.015,bottom: height*0.006,top: height*0.003),
                                                     child: Text(
                                                      snapshot
                                                          .data!
                                                          .schedules![index]
                                                          .team1
                                                          .toString() + ' VS '+ snapshot
                                                           .data!
                                                         .schedules![index]
                                                       .team2
                                                     .toString(),
                                                      maxLines: 2,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      style: GoogleFonts
                                                          .prozaLibre(
                                                          fontSize: height*0.015,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,color: Colors.white),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(left: width*0.015,bottom: height*0.006),
                                                    child: Text(
                                                      '('+snapshot
                                                          .data!
                                                          .schedules![index]
                                                          .gameName
                                                          .toString() +')',
                                                      maxLines: 4,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      style: GoogleFonts
                                                          .prozaLibre(
                                                          fontSize: height*0.015,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,color: Colors.white),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(left: width*0.015,bottom: height*0.006),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.location_on,
                                                        size: height*0.02,
                                                        color: Colors.redAccent,),
                                                        Padding(
                                                          padding:  EdgeInsets.only(left: width*0.01),
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .schedules![index]
                                                                .venue
                                                                .toString(),
                                                            maxLines: 4,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: GoogleFonts
                                                                .prozaLibre(
                                                                fontSize: height*0.015,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                            color: Colors.white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.bottomLeft,
                                                    child: Padding(
                                                      padding:  EdgeInsets.only(left: width*0.015),
                                                      child: Text(
                                                         snapshot
                                                            .data!
                                                            .schedules![index]
                                                            .winner
                                                            .toString(),
                                                        maxLines: 5,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .roboto(
                                                            fontSize: height*0.012,
                                                            fontWeight:
                                                            FontWeight
                                                                .w700,
                                                        color: myColor),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ),
                                          ),
                                        ),
                                      )


                                    ],
                                  ),
                                );
                              } else {
                                print("Yaha");
                                return Container(
                                  child: Center(
                                  child:  Text(
                                      'Comming Soon',
                                      style: GoogleFonts.roboto(
                                        fontSize: height*0.3
                                      ),
                                    )
                                  ),
                                );
                              }
                            });
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const spinkitty = SpinKitFadingCircle(
  size: 50,
  color: Colors.amber,
);

class ButtonSelection extends StatefulWidget {
  final Function(String) onButtonClicked;

  ButtonSelection({required this.onButtonClicked});

  @override
  _ButtonSelectionState createState() => _ButtonSelectionState();
}

class _ButtonSelectionState extends State<ButtonSelection> {
  String selectedButton = '1';
  void selectButton(String buttonId) {
    setState(() {
      selectedButton = buttonId;
    });
  }

  Widget buildButton(String buttonText,String Day,String y) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.001,vertical:height*0.0099 ),
      child: InkWell(
        onTap: () {
          selectButton(buttonText);
            widget.onButtonClicked(y);
        },
        child: Container(
          width: width * 0.18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: selectedButton == buttonText
                  ? Color(0xFF82AC57)
                  : Colors.grey[700]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(
                buttonText,
                style:
                GoogleFonts.roboto(color: Colors.white, fontSize: height * 0.019,fontWeight: FontWeight.w600),
              ),
              Text(
                Day,
                style:
                   GoogleFonts.roboto(color: Colors.white, fontSize: height * 0.019,fontWeight: FontWeight.w600),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.065;
    final double verticalPadding = screenSize.height * 0.02;
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(

        children: [
          buildButton('1','Mar','01-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('2','Mar','02-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('3','Mar','03-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('4','Mar','04-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('5','Mar','05-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('6','Mar','06-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('7','Mar','07-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('8','Mar','08-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('9','Mar','09-03-2024'),
          SizedBox(width: horizontalPadding),
          buildButton('10','Mar','10-03-2024'),
        ],
      ),
    );
  }
}













