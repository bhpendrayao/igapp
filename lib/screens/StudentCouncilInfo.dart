import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/screens/idsScreen.dart';
import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/igleader2.dart';

class StudentCouncilinfo extends StatelessWidget {
  final List<String> image = [
    'images/StudentCouncilImages/HRUSHIKESH JADHAV.jpg',
    'images/StudentCouncilImages/MT22STR010_VINAYAK.jpg',
    'images/StudentCouncilImages/Minza Shahid.jpg',
    'images/StudentCouncilImages/BT20MEC002_ADITYA.jpg',
    'images/StudentCouncilImages/Dhanesh Choudhary.jpg',
    'images/StudentCouncilImages/BT20EEE019_Nikhil_Bhisle.jpg',
    'images/StudentCouncilImages/Satyan Patil.jpg',
    'images/StudentCouncilImages/Samruddhi Wagh.jpg',
    'images/StudentCouncilImages/GANJI NAYAN.jpg',
    'images/StudentCouncilImages/mrunal.jpg',
    'images/StudentCouncilImages/Ayush Chavan.jpg',
    'images/StudentCouncilImages/Alisha Hatalkar.jpg',
  'images/StudentCouncilImages/Yashasvi Therkar.jpg',
    'images/StudentCouncilImages/BT20MEC018 BRAHMANAND Khandale.jpg',
    'images/StudentCouncilImages/Gaurav Mishra.jpg'
  ];
  final List<String> councilposts = [
    'GENERAL SECRETARY',
    'P.G ACADEMIC AFFAIRS SECRETARY',
    'UG ACADEMIC AFFAIRS SECRETARY',
    'MAGAZINE AND LITERARY SECRETARY',
    'TRAINING AND PLACEMENT SECRETARY',
    'TECHNICAL AFFAIRS SECRETARY',
    'SPORTS SECRETARY',
    'CULTURAL SECRETARY',
    'PG SPORTS SEC. & CULTURAL SECRETARY',
    'LADIES REPRESENTATIVE',
    'HOSTEL AFFAIRS SECRETARY (BOYS)',
    'HOSTEL AFFAIRS SECRETARY (GIRLS)',
    'SOCIAL AFFAIRS SECRETARY',
    'ALUMNI SECRETARY SECRETARY',
    'ACADEMIC AFFAIRS SECRETARY',
  ];
  final List<String> councilnames = [
    'HRUSHIKESH JADHAV',
    'VINAYAK',
    'MINZA SHAHID',
    'ADITYA MISHRA',
    'DHANESH ',
    'NIKHIL BHISLE',
    'SATYAN PATIL',
    'SAMRUDDHI WAGH',
    'NAYAN GANJI',
    'MRUNAL SONAWANE',
    'AYUSH CHAVAN',
    'ALISHA HATALKAR ',
    'YASHASVI THERKAR',
    'BHRAMANAND',
    'GAURAV MISHRA',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.black87,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_left,
            color: Colors.green,
            size: height * 0.05
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width*0.13),
              child: Text(
                "STUDENT COUNCIL",
                  style: GoogleFonts.prozaLibre(
                      fontSize: height*0.019,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ) ),
            ),
          ],
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
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.groups,size: height*0.05,),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>StudentCouncilinfo()));
              },
              color: Color(0xFF82AC57),
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
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
        child: GridView.builder(
          shrinkWrap: true, // Set shrinkWrap to true
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: height * 0.009,
            mainAxisSpacing: width * 0.09,
          ),
          itemCount: councilnames.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: height * 0.9,
              width: width * 0.4,
              child: ClipRRect(
                child: CouncilContainer(
                  name: councilnames[index],
                  post: councilposts[index],
                  imageUrl: image[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CouncilContainer extends StatelessWidget {
  final String name;
  final String post;
  final String imageUrl;

  CouncilContainer(
      {required this.imageUrl, required this.name, required this.post});

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded( // Wrap with Expanded
            child:Container(
              width: width * 0.4,
              height: height * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.02),
                  border: Border.all(
                    color: Color(0xFF82AC57),
                    width: width * 0.0052,
                  )
              ),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: height*0.005),
                    child: Padding(
                      padding:  EdgeInsets.all(width*0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            child: Image.asset(imageUrl),
                            height: height*0.15,
                            width: width*0.7,),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              name,
                              style: GoogleFonts.prozaLibre(
                                fontSize: height * 0.008,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              post,
                              style: GoogleFonts.prozaLibre(
                                fontSize: height * 0.006,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),

        ],
      ),
    );
  }
}