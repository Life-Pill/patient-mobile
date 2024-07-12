import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_controller.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_tab_tile.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';
import 'package:patientmobileapplication/features/sub_screens/checkout_screen.dart';
import 'package:patientmobileapplication/features/sub_screens/payment_details_screen.dart';

import '../../Data/apiLinks.dart';


class CartTabScreen extends StatefulWidget {
  @override
  State<CartTabScreen> createState() => _CartTabScreenState();
}

class _CartTabScreenState extends State<CartTabScreen> {
  final CartController cartController = Get.put(CartController());

  Future<void> _createPaymentIntent() async {
    try {
      // Call your backend to create a PaymentIntent
      final response = await http.post(
        Uri.parse(StripePaymentIntentAPI),
        body: json.encode({
          'amount': 5000, // Amount in cents
          'currency': 'usd',
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final paymentIntentData = jsonDecode(response.body);

      // Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['clientSecret'],
          merchantDisplayName: 'LifePill',
        ),
      );

      // Present the payment sheet
      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment successful!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: $error')),
      );
    }
  }
  Future<void> initPaymentSheet() async {
    try {
      // 1. create payment intent on the server
      final data = await _createPaymentIntent();

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: StripePublishableKey,
          // Customer keys
          customerEphemeralKeySecret: "",
          customerId:"1",
          // Extra options
          applePay: const PaymentSheetApplePay(
            merchantCountryCode: 'US',
          ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),
          style: ThemeMode.dark,
        ),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }



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
              padding: const EdgeInsets.only(left: 5.0, right: 10.0),
              child: Obx(() {
                if (cartController.cartItems.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/empty-cart.png',
                      width: 200,
                      height: 200,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTabTile(
                        item: cartController.cartItems[index],
                      );
                    },
                  );
                }
              }),
            ),
          ),
          Obx(() {
            if (cartController.cartItems.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Total: Rs. ${cartController.totalBill.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
          Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(200, 50),
                backgroundColor: Colors.greenAccent.shade200,
              ),
              onPressed: () async {

                await Stripe.instance.presentPaymentSheet();
              },
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
