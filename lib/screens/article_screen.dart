
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/models/article_model.dart';
import 'package:intl/intl.dart';
import 'package:igapp/screens/StudentCouncilInfo.dart';
import 'package:igapp/screens/idsScreen.dart';
import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/igleader2.dart';
import 'package:igapp/view_model/ig_view_model.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class IgArticleScreen extends StatefulWidget {
  const IgArticleScreen({super.key});

  @override
  State<IgArticleScreen> createState() => _IgArticleScreenState();
}

class _IgArticleScreenState extends State<IgArticleScreen> {
  IgViewModel igViewModel = new IgViewModel();
  FilterList? selectedMenu;

  // picture pic = new picture();

  final format = DateFormat('dd/MM/yy');
  String name = "01-03-2024";

  Future<void> _refreshData(String data) async {
    await igViewModel.fetchIgarticleApi(data);
    setState(() {
      name = data; // Update the name variable after fetching data
    });
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    void onButtonClicked(String date) {
      _refreshData(date);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
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
        title: Padding(
          padding:  EdgeInsets.only(top: height*0.037),
          child: Text(
            "ARTICLE",
            style: GoogleFonts.roboto(color: Colors.white, fontSize: height * 0.029,fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,

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
      body: ListView(
        children: [


          Padding(
            padding:  EdgeInsets.only(left: width*.03,top: height*0.03),
            child: Container(
              color: Colors.black,
              height: height * 0.09,
              child: ButtonSelection(onButtonClicked: onButtonClicked),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top:height*.015),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<articlemodel>(
                  future: igViewModel.fetchIgarticleApi(name),
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: SpinKitCircle(
                          size: 50,
                          color: Color(0xFF82AC57),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.articles!.length,
                          itemBuilder: (context, index) {
                            //   DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeatcreate);
                            if (snapshot.data!.articles[index].data
                                .toString() !=
                                "null") {
                              return Padding(
                                padding:  EdgeInsets.symmetric(horizontal: width*.027),
                                child: SingleChildScrollView(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(width: 1,color: Colors.white)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: height*0.01,left: width*0.01,right: width*0.01),
                                            child: Column(
                                              children: [
                                                Text(
                                                    snapshot.data!.articles![index].department!.toString(),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.roboto(color: Colors.white,
                                                        fontSize: height*0.02,fontWeight: FontWeight.w600
                                                    )),
                                                Text(
                                                    snapshot.data!.articles![index].data!.toString(),
                                                    maxLines: 50,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.roboto(color: Colors.white,
                                                        fontSize: height*0.015
                                                    )),
                                              ],
                                            )
                                    ),
                                    color:  Color(0xFF82AC57),
                                    margin: EdgeInsets.all(
                                      16,
                                    ),
                                  ),
                                ),
                              );
                              // return Container(
                              //   decoration:  BoxDecoration(
                              //     color: Colors.black,
                              //   ),
                              //   alignment: Alignment.bottomCenter,
                              //   height: height * .25,
                              //   width: width * .9,
                              //   child: Padding(
                              //     padding:  EdgeInsets.symmetric(
                              //       vertical: height*0.003,horizontal: width*0.04 ),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //
                              //         Padding(
                              //           padding: EdgeInsets.symmetric(
                              //               horizontal: width*0.001),
                              //           child: Container(
                              //             height: height * 0.7,
                              //             width: width * 0.9,
                              //             decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.circular(10),
                              //               border: Border.all(
                              //                 color: Color(0xFF82AC57),
                              //               ),
                              //             ),
                              //             child: ListView(
                              //               children: [
                              //                 Column(
                              //                   children: [
                              //                     Row(
                              //                       mainAxisAlignment: MainAxisAlignment.center,
                              //                       children: [
                              //                         Padding(
                              //                           padding: EdgeInsets.symmetric(
                              //                             horizontal: width * 0.05,
                              //                             vertical: height * 0.01,
                              //                           ),
                              //                           child: Text(
                              //                             snapshot.data!.articles![index].department!.toString(),
                              //                             overflow: TextOverflow.ellipsis,
                              //                             style: GoogleFonts.prozaLibre(
                              //                               fontSize: height * 0.015,
                              //                               fontWeight: FontWeight.w700,
                              //                               color: Colors.white,
                              //                             ),
                              //                           ),
                              //                         ),
                              //                       ],
                              //                     ),
                              //                     Row(
                              //                       children: [
                              //                         Padding(
                              //                           padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                              //                           child: Container(
                              //                             width: width * 0.7,
                              //                             height: height * 0.2,
                              //                             decoration: BoxDecoration(
                              //                               border: Border.all(
                              //                                 color: Colors.transparent,
                              //                               ),
                              //                             ),
                              //                             child: Padding(
                              //                               padding: EdgeInsets.symmetric(
                              //                                 horizontal: width * 0.04,
                              //                                 vertical: height * 0.01,
                              //                               ),
                              //                               child: Text(
                              //                                 // Your text content here
                              //                                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              //                                 maxLines: 20,
                              //                                 overflow: TextOverflow.ellipsis,
                              //                                 style: GoogleFonts.prozaLibre(
                              //                                   fontSize: height * 0.015,
                              //                                   fontWeight: FontWeight.w500,
                              //                                   color: Colors.white,
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                           ),
                              //                         ),
                              //                       ],
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //
                              //
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // );
                            } else {
                              return Container();
                            }
                          });
                    }
                  },
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

const spinkitty = SpinKitFadingCircle(
  size: 50,
  color: Colors.amber,
);


class _ButtonSelectionState extends State<ButtonSelection> {
  String selectedButton = '';
  void selectButton(String buttonId) {
    setState(() {
      selectedButton = buttonId;
    });
  }

  Widget buildButton(String buttonText,String Day,String y) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical:height*0.009 ),
      child: InkWell(
        onTap: () {
          selectButton(buttonText);
          widget.onButtonClicked(y);
        },
        child: Container(
          width: width * 0.10,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: width*0.03
              ),
              borderRadius: BorderRadius.all(Radius.circular(width*0.03)),

              color: selectedButton == buttonText
                  ? Color(0xFF82AC57)
                  : Colors.grey[700]),
          child: Column(
            children: [

              Center(
                child: Text(
                  buttonText,
                  style:
                  GoogleFonts.roboto(color: Colors.white, fontSize: height * 0.019,fontWeight: FontWeight.w600),
                ),
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
    final double horizontalPadding = screenSize.width * 0.01;
    final double verticalPadding = screenSize.height * 0.02;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(

        children: [
          buildButton('1','Mar','01-03-2024'),
          buildButton('2','Mar','02-03-2024'),
          buildButton('3','Mar','03-03-2024'),
          buildButton('4','Mar','04-03-2024'),
          buildButton('5','Mar','05-03-2024'),
          buildButton('6','Mar','06-03-2024'),
          buildButton('7','Mar','07-03-2024'),
          buildButton('8','Mar','08-03-2024'),
          buildButton('9','Mar','09-03-2024'),
          buildButton('10','Mar','10-03-2024'),
        ],
      ),
    );
  }
}












