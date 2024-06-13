import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patientmobileapplication/features/Data/apiLinks.dart';

class Pharmacy {
  String pharmacy_id;
  String name;
  bool isOpen;
  String logo;
  double price;
  String unit;
  double rating;
  String address;
  String phoneNumber;

  Pharmacy({
    required this.pharmacy_id,
    required this.name,
    required this.logo,
    required this.isOpen,
    required this.price,
    required this.unit,
    required this.rating,
    required this.address,
    required this.phoneNumber,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      pharmacy_id: json['branchDTO']['branchId'].toString(),
      name: json['branchDTO']['branchName'],
      isOpen: json['branchDTO']['branchStatus'],
      logo: json['branchDTO']['branchImage'] ?? 'assets/images/pharmacy.png',
      price: json['sellingPrice'],
      unit: json['measuringUnitType'],
      rating: (json['rate'] as num).toDouble(),
      address: json['branchDTO']['branchAddress'],
      phoneNumber: json['branchDTO']['branchContact'],
    );
  }
}

Future<List<Pharmacy>> fetchPharmacies(String medicineName) async {
  final response = await http.get(Uri.parse('$medicineSearch$medicineName'));
  
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['data'];
    return data.map((item) => Pharmacy.fromJson(item)).toList();
  } else {
    throw Exception('Pharmacy data not found!');
  }
}

Future<List<Pharmacy>> sortSearchResults(String criteria, String medicineName) async {
  List<Pharmacy> filteredResults = await fetchPharmacies(medicineName);

  filteredResults.forEach((pharmacy) {
    print('filtered results: ${pharmacy.name}');
  });

  List<Pharmacy> sortedResults = List.from(filteredResults);

  switch (criteria) {
    case 'name':
      sortedResults.sort((a, b) => a.name.compareTo(b.name));
      break;
    case 'open':
      sortedResults.sort((a, b) {
        if (a.isOpen == b.isOpen) {
          return 0;
        } else {
          return a.isOpen ? -1 : 1;
        }
      });
      sortedResults.sort((a, b) {
        if (a.isOpen && b.isOpen) {
          return a.price.compareTo(b.price);
        }
        return 0;
      });
      break;
    case 'price':
      sortedResults.sort((a, b) => a.price.compareTo(b.price));
      break;
    case 'rating':
      sortedResults.sort((a, b) => b.rating.compareTo(a.rating));
      break;
    default:
      sortedResults.sort((a, b) => a.price.compareTo(b.price));
  }

  return sortedResults;
}
