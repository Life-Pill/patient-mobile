import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_controller.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_tab_tile.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';


class CartTabScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TopNavBar(
                NeedSearchBar: false,
                TabName: "Your Cart",
              ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Obx(() => ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTabTile(
                        item: cartController.cartItems[index],
                      );
                    },
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => Text(
                    "Total: Rs. ${cartController.totalBill.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(200, 50),
                backgroundColor: Colors.greenAccent.shade200,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Checkout (${cartController.cartItems.length} items)"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
