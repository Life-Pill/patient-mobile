import 'package:patientmobileapplication/features/Repository/search_results_sorted.dart';

class Medicine {
  final String name;
  final String imageUrl;
  final double price;
  final String unit;
  final String medicine_id;
  final List<String> pharmacy_ids;

  Medicine(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.unit,
      required this.medicine_id,
      required this.pharmacy_ids});

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
        name: json['name'],
        imageUrl: json['imageUrl'],
        price: json['price'],
        unit: json['unit'],
        medicine_id: json['id'],
        pharmacy_ids: json['pharmacy_ids']);
  }
}
