import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:igapp/models/ig_leader_model.dart';
import 'package:igapp/models/imagemodel.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:igapp/models/notificationmodel.dart';

import 'package:google_fonts/google_fonts.dart';
class picture extends StatefulWidget {
  const picture({super.key});

  @override
  State<picture> createState() => _pictureState();
}

class _pictureState extends State<picture> {
  @override
  IgViewModel igViewModel= new IgViewModel();

  Future<void> _refreshData(String data) async {
    // Fetch the updated data from the API
    await igViewModel.fetchIgimageApi();
    // Trigger a rebuild with the new data
    setState(() {});
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return  Container(
      height: MediaQuery.of(context).size.height*0.4,
      width: MediaQuery.of(context).size.width,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: height*0.4,
              width: width,
              child: FutureBuilder<List<imagemodel>>(
                future:igViewModel.fetchIgimageApi(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  }
                  else{
                    return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)
                        {
                          //   DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeatcreate);
                          if(index < snapshot.data!.length) {
                            if (snapshot.data![index].imageUrl != null &&
                                snapshot.data![index].imageUrl.toString() !=
                                    "null") {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  height: height*0.3,
                                  width: width*0.9,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data![index].imageUrl
                                          .toString(),
                                      fit: BoxFit.fitHeight,
                                      placeholder: (context, url) =>
                                          Container(child: spinkitty,),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error_outline,
                                            color: Colors.redAccent,),

                                    ),


                                  ),


                                ),
                              );
                            }
                            else {
                              return Container();
                            }
                          }
                          else{
                            Container();
                          }

                        }
                    );
                  }
                },

              ),
          ),
        ],
      ),
    );
  }

}

const spinkitty=SpinKitFadingCircle(
  size: 50,
  color: Colors.amber,
);