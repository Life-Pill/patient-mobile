import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_controller.dart';

class CartTabTile extends StatelessWidget {
  final CartItem item;
  final CartController cartController = Get.find<CartController>();

  CartTabTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double total_price = item.price * item.count;
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: 100.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
          color: Colors.yellow.shade200,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.only(top: 24.0, bottom: 24.0, right: 16.0, left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(item.pharmacy_imageUrl),
                  radius: 30.0,
                ),
                SizedBox(width: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.medicine_name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      item.pharmacy_name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rs. ${total_price.toString()}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  '${item.count.toString()} ${item.unit}s',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                cartController.removeItem(item.index);
                print("removed index ${item.index}");
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.red.shade500,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Icon(Icons.delete),
              ),
            )
          ],
        ),
      ),
    );
  }
}
