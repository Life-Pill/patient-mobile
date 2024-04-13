import 'package:patientmobileapplication/features/Repository/search_results_sorted.dart';

class Cart {
  final String pharmacy_imageUrl;
  final double price;
  final String unit;
  final String medicine_name;
  final String pharmacy_name;

  Cart(
      {required this.pharmacy_imageUrl,
      required this.price,
      required this.unit,
      required this.medicine_name,
      required this.pharmacy_name});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        pharmacy_imageUrl: json['imageUrl'],
        price: json['price'],
        unit: json['unit'],
        medicine_name: json['name'],
        pharmacy_name: json['pharmacy_name']);
  }
}
