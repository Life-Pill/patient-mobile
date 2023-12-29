import 'package:flutter/material.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,  child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body:  TabBarView(
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
          Icon(Icons.directions_bike),
        ],
      ),
    ),
    );
  }
}
