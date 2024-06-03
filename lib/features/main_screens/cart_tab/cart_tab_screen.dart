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
          Obx(() => TopNavBar(
                NeedSearchBar: false,
                TabName: "Your Cart (${cartController.cartItems.length} items)",
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
        ],
      ),
    );
  }
}
