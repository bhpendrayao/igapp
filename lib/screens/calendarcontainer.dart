import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calendercontainer extends StatefulWidget {
  Calendercontainer({super.key, required this.val, required this.day});
  final int val;
  final Map<int, String> day;

  @override
  State<Calendercontainer> createState() => _CalendercontainerState();
}

class _CalendercontainerState extends State<Calendercontainer> {
  Color _containerColor = Colors.grey;
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            _containerColor = Colors.white;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 6,
          height: MediaQuery.of(context).size.height / 13,
          decoration: BoxDecoration(
              color: _containerColor, borderRadius: BorderRadius.circular(3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${widget.day[widget.val % 7]}",
                style: GoogleFonts.prozaLibre(fontSize: height*0.02, fontWeight: FontWeight.w600),
              ),
              Text("${widget.val}",
                  style: GoogleFonts.prozaLibre(fontSize: height*0.019, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
