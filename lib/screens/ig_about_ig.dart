import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_screen.dart';

class AboutIG extends StatefulWidget {
  const AboutIG({super.key});

  @override
  State<AboutIG> createState() => _AboutIDSState();
}

class _AboutIDSState extends State<AboutIG> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_left,
              color: Color(0xFF82AC57),
              size: height * 0.06,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: height * 0.03),
            child: Text(
              "अद्वैतम्",
              style: TextStyle(color: Colors.white, fontSize: height * 0.035),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(
                  Icons.notification_add_outlined,
                  size: height * 0.03,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IgNotificationScreen()));
                },
              ),
            ),
          ]),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.075, horizontal: width * 0.05),
              child: Text(
                "The Institute Development Society at VNIT Nagpur is a student organization focused on promoting We Development, Android Development\nBlockchain technology , Competitive programming and UI/UX. IDS's primary aim is to prepare its members for Hackathons and cultivate a coding culture at VNIT Nagpur. Through workshops, seminars, coding challenges, and collaborative projects, IDS equips its members with Practical  skills for success in these dynamic tech  fields. Serving as a bridge between academics and industry requirements, IDS ensures students are well-prepared for tech careers.",
                style:
                GoogleFonts.prozaLibre(color: Colors.white, fontSize: height*0.015),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: height * 0.25,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("deptlogos/logo-removebg-preview.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
