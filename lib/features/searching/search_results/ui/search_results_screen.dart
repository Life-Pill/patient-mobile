import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/searching/search_results/ui/search_tabs.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              height: 80.0,
              padding: EdgeInsets.only(top:30.0,right: 20.0,left: 20.0,bottom: 0.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Image(
                          image: AssetImage("assets/images/app_back_btn.png"),
                          width: 40.0,
                          height: 40.0,
                        ),
                        onTap: Get.back,
                      ),
                      Text(
                        "Search results",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFDFDFC),
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SearchTabs(),
            ),
          ],
        ),
      ),
    );
  }
}
