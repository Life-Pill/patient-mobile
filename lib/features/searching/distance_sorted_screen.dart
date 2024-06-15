// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:patientmobileapplication/features/Data/apiLinks.dart';
// import 'dart:convert';

// import 'package:patientmobileapplication/features/Repository/search_results_from_api.dart';
// import 'package:patientmobileapplication/features/searching/results_card/ui/results_card_ui.dart';


// class DistanceSorted extends StatelessWidget {
//   final String searchedMedicine;
//   final String openCageApiKey = openCageGeolocatorAPIKey;

//   DistanceSorted({super.key, required this.searchedMedicine});

//   Future<Position> _getUserLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       throw 'Location services are disabled.';
//     }

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         throw 'Location permissions are denied';
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       throw 'Location permissions are permanently denied.';
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   Future<List<Pharmacy>> _sortPharmaciesByDistance(String medicineName) async {
//     Position userLocation = await _getUserLocation();
//     List<Pharmacy> pharmacies = await fetchPharmacies(medicineName);

//     for (var pharmacy in pharmacies) {
//       var coordinates = await _getCoordinatesFromAddress(pharmacy.address);
//       if (coordinates != null) {
//         pharmacy.distance = Geolocator.distanceBetween(
//           userLocation.latitude,
//           userLocation.longitude,
//           coordinates[0],
//           coordinates[1],
//         );
//       } else {
//         pharmacy.distance = double.infinity;
//       }
//     }

//     pharmacies.sort((a, b) => a.distance.compareTo(b.distance));
//     return pharmacies;
//   }

//   Future<List<double>?> _getCoordinatesFromAddress(String address) async {
//     final response = await http.get(
//       Uri.parse('https://api.opencagedata.com/geocode/v1/json?q=$address&key=$openCageApiKey'),
//     );

//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       if (data['results'].isNotEmpty) {
//         var coordinates = data['results'][0]['geometry'];
//         return [coordinates['lat'], coordinates['lng']];
//       }
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Pharmacy>>(
//         future: _sortPharmaciesByDistance(searchedMedicine),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No results found.'));
//           } else {
//             List<Pharmacy> sortedResults = snapshot.data!;
//             return ListView.builder(
//               itemCount: sortedResults.length,
//               itemBuilder: (context, index) {
//                 Pharmacy pharmacy = sortedResults[index];
//                 return ResultsCard(
//                   medicine_name: searchedMedicine,
//                   isOpen: pharmacy.isOpen,
//                   pharmacy_name: pharmacy.name,
//                   logo: pharmacy.logo,
//                   price: pharmacy.price,
//                   unit: pharmacy.unit,
//                   rating: pharmacy.rating,
//                   address: pharmacy.address,
//                   phone: pharmacy.phoneNumber,
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
