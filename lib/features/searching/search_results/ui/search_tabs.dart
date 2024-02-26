import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/searching/open_sorted/ui/rating_sorted_screen.dart';
import 'package:patientmobileapplication/features/searching/price_sorted/ui/rating_sorted_screen.dart';
import 'package:patientmobileapplication/features/searching/rating_sorted/ui/rating_sorted_screen.dart';
import 'package:patientmobileapplication/features/searching/results_card/ui/results_card_ui.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
              Tab(
                text: "Distance",
              ),
            ],
          ),
          backgroundColor: Colors.blue,
        ),
        body: TabBarView(
          children: [
            // TODO: get the pages to display here
            RatingSorted(),
            PriceSorted(),
            OpenSorted(),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
