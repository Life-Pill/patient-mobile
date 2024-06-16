// import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:location/location.dart' as loc;
// import 'package:geocoding/geocoding.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:math';
//
// import 'package:patientmobileapplication/features/Repository/search_results_from_api.dart';
// import 'package:patientmobileapplication/features/searching/results_card/ui/results_card_ui.dart';
//
//
// class DistanceSorted extends StatelessWidget {
//   final String searchedMedicine;
//
//   DistanceSorted({super.key, required this.searchedMedicine});
//
//   Future<loc.LocationData> _getUserLocation() async {
//     loc.Location location = loc.Location();
//
//     bool serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         throw 'Location services are disabled.';
//       }
//     }
//
//     PermissionStatus permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         throw 'Location permissions are denied';
//       }
//     }
//
//     return await location.getLocation();
//   }
//
//   Future<List<Pharmacy>> _sortPharmaciesByDistance(String medicineName) async {
//     LocationData userLocation = await _getUserLocation();
//     List<Pharmacy> pharmacies = await fetchPharmacies(medicineName);
//
//     for (var pharmacy in pharmacies) {
//       var coordinates = await _getCoordinatesFromAddress(pharmacy.address);
//       if (coordinates != null) {
//         pharmacy.distance = _calculateDistance(
//           userLocation.latitude!,
//           userLocation.longitude!,
//           coordinates[0],
//           coordinates[1],
//         );
//       } else {
//         pharmacy.distance = double.infinity;
//       }
//     }
//
//     pharmacies.sort((a, b) => a.distance.compareTo(b.distance));
//     return pharmacies;
//   }
//
//   double _calculateDistance(
//       double startLatitude,
//       double startLongitude,
//       double endLatitude,
//       double endLongitude) {
//     const double earthRadius = 6371000; // meters
//     final double dLat = _degreeToRadian(endLatitude - startLatitude);
//     final double dLon = _degreeToRadian(endLongitude - startLongitude);
//
//     final double a = (sin(dLat / 2) * sin(dLat / 2)) +
//         (cos(_degreeToRadian(startLatitude)) *
//             cos(_degreeToRadian(endLatitude)) *
//             sin(dLon / 2) *
//             sin(dLon / 2));
//     final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
//
//     return earthRadius * c;
//   }
//
//   double _degreeToRadian(double degree) {
//     return degree * pi / 180;
//   }
//
//   Future<List<double>?> _getCoordinatesFromAddress(String address) async {
//     try {
//       List<Location> locations = await locationFromAddress(address);
//       if (locations.isNotEmpty) {
//         return [locations.first.latitude, locations.first.longitude];
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//     return null;
//   }
//
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
