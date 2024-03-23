import '../Data/pharmacy_results_data.dart';

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
  List <String> medicines = [];

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
    required this.medicines,
  });
}

// List<Pharmacy> sortSearchResults(List<Pharmacy> searchResults, String criteria,String medicine_name) {


//  List<Pharmacy> sortedResults = List.from(searchResults);


 List<Pharmacy> sortSearchResults(List<Pharmacy> searchResults, String criteria, String medicineName) {

 searchResults.forEach((pharmacy) {
    print('search results :   ${pharmacy.name} : ${pharmacy.medicines} : ${medicineName} -- ${pharmacy.medicines.any((medicine) => medicine.toLowerCase() == medicineName.toLowerCase())}');
  });

   List<Pharmacy> filteredResults = searchResults.where((pharmacy) => pharmacy.medicines.any((medicine) => medicine.toLowerCase() == medicineName.toLowerCase())).toList();

 filteredResults.forEach((pharmacy) {
    print('filtered results :   ${pharmacy.name}');
  });

//   // Create a new list to avoid modifying the original
   List<Pharmacy> sortedResults = List.from(filteredResults);
 sortedResults.forEach((pharmacy) {
    print('sorted results :   ${pharmacy.name}');
  });

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
    // Default sorting by name
      sortedResults.sort((a, b) => a.price.compareTo(b.price));
  }

 
  return sortedResults;
 
  
}

void main() {
String medicineName = 'Aspirin';
  String sortCriteria = 'price'; // You can change this to 'name', 'open', or 'rating' based on your requirements

  List<Pharmacy> sortedPharmacies = sortSearchResults(pharmacyData, medicineName, sortCriteria);

  // Print sorted pharmacies
  sortedPharmacies.forEach((pharmacy) {
    print('${pharmacy.name} - ${pharmacy.price}');
  });
}
