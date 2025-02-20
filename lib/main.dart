import 'package:flutter/material.dart';
import 'package:igapp/DeptScreens/ArchiScreen.dart';
import 'package:igapp/DeptScreens/ChemicalScreen.dart';
import 'package:igapp/DeptScreens/CivilScreen.dart';
import 'package:igapp/DeptScreens/CseScreen.dart';
import 'package:igapp/DeptScreens/EeeScreen.dart';
import 'package:igapp/DeptScreens/MechScreen.dart';
import 'package:igapp/DeptScreens/MetaScreen.dart';
import 'package:igapp/DeptScreens/Mining.dart';
import 'package:igapp/screens/SplashScreen.dart';
import 'package:igapp/screens/ig_schedule_screen.dart';

import 'DeptScreens/EceScreen.dart';


void main()  {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/ece': (context) => EceScreen(),
        '/cse': (context) => CseScreen(),
        '/civil': (context) => CivilScreen(),
        '/mech': (context) => MechScreen(),
        '/archi': (context) => ArchiScreen(),
        '/eee': (context) => EeeScreen(),
        '/cme' :(context) => Chemical(),
        '/min':(context) => Mining(),
        '/mme':(context) => MetaScreen(),



        // Add more routes for other screens here
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        iconTheme: IconThemeData(color: Colors.white),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
