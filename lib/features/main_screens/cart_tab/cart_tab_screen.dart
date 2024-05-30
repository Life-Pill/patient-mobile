// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/Data/cart_data.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/DataModel/cart_data_model.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_tab_tile.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';

class CartTabScreen extends StatefulWidget {
  const CartTabScreen({Key? key}) : super(key: key);

  @override
  State<CartTabScreen> createState() => _CartTabScreenState();
}

class _CartTabScreenState extends State<CartTabScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  Profile current_user = new Profile();

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
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  Cart cartItem = cartItems[index];
                  return CartTabTile(
                    medicine_imageUrl: cartItem.pharmacy_imageUrl,
                    price: cartItem.price,
                    unit: cartItem.unit,
                    medicine_name: cartItem.medicine_name,
                    pharmacy_name: cartItem.pharmacy_name,
                    medicine_count: cartItem.count,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
