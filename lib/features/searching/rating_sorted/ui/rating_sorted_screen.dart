import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/Repository/search_results_sorted.dart';
import 'package:patientmobileapplication/features/searching/results_card/ui/results_card_ui.dart';

import '../../../Data/pharmacy_results_data.dart';

class RatingSorted extends StatelessWidget {
  final String searchedMedicine;
   RatingSorted({super.key, required this.searchedMedicine});
  List<Pharmacy> sortedResults = [];

  @override
  Widget build(BuildContext context) {
    sortedResults = sortSearchResults(pharmacyData, "rating", searchedMedicine);
    return Scaffold(
      body: ListView.builder(
        itemCount: sortedResults.length,
        itemBuilder: (context, index) {
          // Retrieve each pharmacy object from the sorted results
          Pharmacy pharmacy = sortedResults[index];
          // Return a ResultsCard widget populated with the pharmacy data
          return ResultsCard(
            isOpen: pharmacy.isOpen,
            name: pharmacy.name,
            logo: pharmacy.logo,
            price: pharmacy.price,
            unit: pharmacy.unit,
            rating: pharmacy.rating,
            address: pharmacy.address,
            phone: pharmacy.phoneNumber,
          );
        },
      ),
    );
  }


}
