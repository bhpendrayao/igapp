import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:intl/intl.dart';
import 'package:igapp/models/notificationmodel.dart';
import 'package:igapp/view_model/ig_view_model.dart';

class IgNotificationScreen extends StatefulWidget {
  const IgNotificationScreen({super.key});

  @override
  State<IgNotificationScreen> createState() => _IgNotificationScreenState();
}

class _IgNotificationScreenState extends State<IgNotificationScreen> {
  IgViewModel igViewModel = IgViewModel();
  final format= DateFormat('dd/MM/yy');
  Future<void> _refreshData(String data) async {
    // Fetch the updated data from the API
    await igViewModel.fetchIgnotificationApi();
    // Trigger a rebuild with the new data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        leading:  Padding(
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
        titleSpacing: 20,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "Notification",
            style: GoogleFonts.roboto(color: Colors.white, fontSize: height * 0.02,fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: height,
              width: width,
              child: FutureBuilder<notificationmodel>(
                future: igViewModel.fetchIgnotificationApi(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.notifications!.length,
                        itemBuilder: (context, index) {
                          //   DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeatcreate);
                          if (snapshot.data!.notifications[index].data
                                  .toString() !=
                              "null") {
                            DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeAtCreate.toString());
                              return Padding(
                                padding:  EdgeInsets.symmetric(horizontal: width*.06, vertical: height*0.01,),
                                child: SingleChildScrollView(
                                  child: Card(

                                    color: Color(0xFF82AC57),
                                    child: Padding(
                                        padding: EdgeInsets.only(top: height*0.001,left: width*0.01,right: width*0.01),
                                        child: Column(
                                          children: [
                                            Text(
                                                snapshot.data!.notifications![index].data.toString(),
                                                maxLines: 50,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(color: Colors.white,
                                                    fontSize: height*0.016,fontWeight: FontWeight.w600
                                                )),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                  format.format(dateTime),
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.roboto(color: Colors.black87,
                                                      fontSize: height*0.013,
                                                    fontWeight: FontWeight.w700
                                                  )),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                ),
                              );
                          } else {
                            return Container();
                          }
                        });
                  }
                },
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
