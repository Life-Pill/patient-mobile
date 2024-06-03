import 'package:get/get.dart';

class CartItem {
 
  final int count;
  final String pharmacy_imageUrl;
  final double price;
  final String unit;
  final String medicine_name;
  final String pharmacy_name;
  final int index;

  CartItem({
    
    required this.count,
    required this.pharmacy_imageUrl,
    required this.price,
    required this.unit,
    required this.medicine_name,
    required this.pharmacy_name, required this.index,
  });
}

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addItem(CartItem item) {
    cartItems.add(item);
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }
}
