import 'package:shared_preferences/shared_preferences.dart';

void EsaveCseToSharedPreferences(int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('csePointsE', points);
}

// Function to retrieve CSE points from Shared Preferences
Future<int?> EgetCseFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('csePointsE');
}
//2
void EsaveMechToSharedPreferences(int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('mechpE', points);
}

Future<int?> EgetMechFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('mechpE');
}//3
void EsaveCivToSharedPreferences(int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('civpE', points);
}

// Function to retrieve CSE points from Shared Preferences
Future<int?> EgetCivFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('civpE');
}//4
void EsaveEceToSharedPreferences(int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('ecepE', points);
}

// Function to retrieve CSE points from Shared Preferences
Future<int?> EgetEceFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('ecepE');
}//5
void EsaveEeeToSharedPreferences(int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('eeepE', points);
}

// Function to retrieve CSE points from Shared Preferences
Future<int?> EgetEeeFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('eeepE');
}
void EsaveMetaToSharedPreferences(int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('metapE', points);
}

// Function to retrieve CSE points from Shared Preferences
Future<int?> EgetMetaFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('metapE');
}
void EsaveChemminToSharedPreferences(int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('chemminpE', points);
}

// Function to retrieve CSE points from Shared Preferences
Future<int?> EgetChemminFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('chemminpE');
}//
void EsaveArchiToSharedPreferences(int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('archipE', points);
}

// Function to retrieve CSE points from Shared Preferences
Future<int?> EgetArchiFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('archipE');
}




