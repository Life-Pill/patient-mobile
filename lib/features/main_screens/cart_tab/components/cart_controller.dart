import 'package:get/get.dart';

import '../../../Data/cart_data.dart' as cartValue;


class CartController extends GetxController {
var cartItems = cartValue.cartItems;
  // Simulate fetching cart items from a data source
  void fetchCartItems() {
    // Replace this with your actual data fetching logic
    var fetchedItems = cartItems;

    cartItems.assignAll(fetchedItems);
  }
}
