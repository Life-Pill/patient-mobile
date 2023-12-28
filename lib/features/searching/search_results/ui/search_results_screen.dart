import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            height: 180.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border(
                bottom: BorderSide(
                  color: Colors.blue,
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36.0),
                bottomRight: Radius.circular(36.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/images/app_back_btn.png"),
                  width: 40.0,
                  height: 40.0,
                ),



                    Text(
                          "Search results",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFDFDFC)),


                    ),
         
              ],
            ),
          )
        ],
      ),
    );
  }
}
