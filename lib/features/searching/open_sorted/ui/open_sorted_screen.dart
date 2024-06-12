import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/Repository/search_results_from_api.dart';
import 'package:patientmobileapplication/features/searching/results_card/ui/results_card_ui.dart';

import '../../../Data/pharmacy_results_data.dart';

class OpenSorted extends StatelessWidget {
  final String searchedMedicine;

  OpenSorted({super.key, required this.searchedMedicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Pharmacy>>(
        future: sortSearchResults("open", searchedMedicine),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No results found.'));
          } else {
            List<Pharmacy> sortedResults = snapshot.data!;
            return ListView.builder(
              itemCount: sortedResults.length,
              itemBuilder: (context, index) {
                Pharmacy pharmacy = sortedResults[index];
                return ResultsCard(
                  medicine_name: searchedMedicine,
                  isOpen: pharmacy.isOpen,
                  pharmacy_name: pharmacy.name,
                  logo: pharmacy.logo,
                  price: pharmacy.price,
                  unit: pharmacy.unit,
                  rating: pharmacy.rating,
                  address: pharmacy.address,
                  phone: pharmacy.phoneNumber,
                );
              },
            );
          }
        },
      ),
    );
  }
}
