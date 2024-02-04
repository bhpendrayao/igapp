import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/models/imagemodel.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../view_model/ig_view_model.dart';

import 'package:igapp/screens/StudentCouncilInfo.dart';
import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/idsScreen.dart';
import 'package:igapp/screens/igleader2.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Picoftheday extends StatefulWidget {
  const Picoftheday({super.key});

  @override
  State<Picoftheday> createState() => _PicofthedayState();
}

class _PicofthedayState extends State<Picoftheday> {
  IgViewModel igViewModel = new IgViewModel();
  FilterList? selectedMenu;

  // picture pic = new picture();

  final format = DateFormat('dd/MM/yy');
  String name = "01-03-2024";

  Future<void> _refreshData(String data) async {
    await igViewModel.fetchIgscheduleApi(data);
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
          "PIC OF THE DAY",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width*.04,top: height*0.03),
              child: Container(
                color: Colors.black,
                height: height * 0.09,
                child: ButtonSelection(onButtonClicked: onButtonClicked),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.7,
                    width: width,
                    color: Colors.black87,
                    child: FutureBuilder<List<imagemodel>>(
                      future: igViewModel.fetchIgimageApi(name),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: SpinKitCircle(
                              size: 50,
                              color: Colors.blue,
                            ),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                //   DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeatcreate);
                                if (index < snapshot.data!.length) {
                                  if (snapshot.data![index].imageUrl !=
                                          null &&
                                      snapshot.data![index].imageUrl
                                              .toString() !=
                                          "null") {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: width*.04,vertical: height*0.03),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 3,
                                                color: Color(0xFF82AC57)
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(15),
                                            ),
                                            height: height * 0.3,
                                            width: width * 0.85,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: CachedNetworkImage(
                                                imageUrl: snapshot
                                                    .data![index].imageUrl
                                                    .toString(),
                                                fit: BoxFit.fitHeight,
                                                placeholder: (context, url) =>
                                                    Container(
                                                  child: spinkitty,
                                                ),
                                                errorWidget:
                                                    (context, url, error) => Icon(
                                                  Icons.error_outline,
                                                  color: Color(0xFF82AC57),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(top: height*0.01,left: width*0.08),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("Description : ",
                                                style: GoogleFonts.prozaLibre(
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),

                                        Padding(
                                          padding:  EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.08),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: width * 0.85,
                                              height:height*0.2,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF82AC57),
                                                border: Border.all(

                                                    color:Colors.white,
                                                ),

                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01),
                                                  child: Text(
                                                    snapshot
                                                        .data![index].description
                                                        .toString(),
                                                  style:
                                                    GoogleFonts.roboto(fontSize: height*0.015, color: Colors.white),
                                                    maxLines: 6,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Container(
                                    );
                                  }
                                } else {
                                  Container();
                                }
                              });
                        }
                      },
                    ),
                  ),
                ],
              ),
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
      padding:  EdgeInsets.symmetric(horizontal: width*0.009,vertical:height*0.009 ),
      child: InkWell(
        onTap: () {
          selectButton(buttonText);
          widget.onButtonClicked(y);
        },
        child: Container(
          width: width * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: selectedButton == buttonText
                  ? Colors.green
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
    final double horizontalPadding = screenSize.width * 0.07;
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













