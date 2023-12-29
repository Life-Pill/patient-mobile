import 'package:flutter/material.dart';
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
              // Adjust the height as needed
              height: 180.0,
              padding: EdgeInsets.all(20.0),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
