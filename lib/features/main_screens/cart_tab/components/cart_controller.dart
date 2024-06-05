import 'package:get/get.dart';
import 'package:hive/hive.dart';

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
    required this.pharmacy_name,
    required this.index,
  });

  // Convert a CartItem to a map
  Map<dynamic, dynamic> toMap() {
    return {
      'count': count,
      'pharmacy_imageUrl': pharmacy_imageUrl,
      'price': price,
      'unit': unit,
      'medicine_name': medicine_name,
      'pharmacy_name': pharmacy_name,
      'index': index,
    };
  }

  // Convert a map to a CartItem
  factory CartItem.fromMap(Map<dynamic, dynamic> map) {
    return CartItem(
      count: map['count'],
      pharmacy_imageUrl: map['pharmacy_imageUrl'],
      price: map['price'],
      unit: map['unit'],
      medicine_name: map['medicine_name'],
      pharmacy_name: map['pharmacy_name'],
      index: map['index'],
    );
  }
}
class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  late Box<Map<dynamic, dynamic>> cartBox;

  @override
  void onInit() {
    super.onInit();
    _openCartBox().then((_) => _loadCartItems());
  }

  Future<void> _openCartBox() async {
    cartBox = await Hive.openBox<Map<dynamic, dynamic>>('cartBox');
  }

  Future<void> addItem(CartItem item) async {
    cartItems.add(item);
    await cartBox.add(item.toMap()); // Save to Hive as map
  }

  Future<void> removeItem(int index) async {
    await cartBox.deleteAt(index); // Remove from Hive
    cartItems.removeAt(index);
  }

  double get totalBill {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.count));
  }

  void _loadCartItems() {
    cartItems.addAll(cartBox.values.map((e) {
      try {
        return CartItem.fromMap(Map<dynamic, dynamic>.from(e));
      } catch (error) {
        print("Error loading cart item: $error");
        return null;
      }
    }).whereType<CartItem>().toList());
  }
}
