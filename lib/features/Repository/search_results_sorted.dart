import '../Data/pharmacy_results_data.dart';

class Pharmacy {
  String name;
  bool isOpen;
  String logo;
  double price;
  String unit;
  double rating;
  String address;
  String phoneNumber;

  Pharmacy({
    required this.name,
    required this.logo,
    required this.isOpen,
    required this.price,
    required this.unit,
    required this.rating,
    required this.address,
    required this.phoneNumber,
  });
}

List<Pharmacy> sortSearchResults(List<Pharmacy> searchResults, String criteria) {
  List<Pharmacy> sortedResults = List.from(searchResults); // Create a new list to avoid modifying the original

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

}
