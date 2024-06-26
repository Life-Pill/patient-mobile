import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/searching/distance_sorted/distance_sorted_screen.dart';
import 'package:patientmobileapplication/features/searching/open_sorted/ui/open_sorted_screen.dart';
import 'package:patientmobileapplication/features/searching/price_sorted/ui/price_sorted_screen.dart';
import 'package:patientmobileapplication/features/searching/rating_sorted/ui/rating_sorted_screen.dart';
import 'package:patientmobileapplication/features/searching/results_card/ui/results_card_ui.dart';

class SearchTabs extends StatelessWidget {
  final String searchedText;
  const SearchTabs({Key? key, required this.searchedText});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          title: TabBar(


            dividerHeight: 0.0,
            labelPadding: EdgeInsets.all(0.0),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Center(
                  child: Text(
                    "Rating",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Tab(
                text: "Price",
              ),
              Tab(
                text: "Open",
              ),

            ],
          ),
          backgroundColor: Colors.blue,
        ),
        body: TabBarView(
          children: [
            // TODO: get the pages to display here
            RatingSorted(searchedMedicine: searchedText,),
            PriceSorted(searchedMedicine: searchedText),
            OpenSorted(searchedMedicine: searchedText),
           // DistanceSorted(searchedMedicine: searchedText),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
