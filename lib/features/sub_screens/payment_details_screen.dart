import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/cart_tab_screen.dart';
import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';

import '../main_screens/cart_tab/components/cart_controller.dart';

class PaymentDetailsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Payment Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(labelText: "Card Number"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your card number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _expiryDateController,
                decoration: InputDecoration(labelText: "Expiry Date (MM/YY)"),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter expiry date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cvvController,
                decoration: InputDecoration(labelText: "CVV"),
                keyboardType: TextInputType.number,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter CVV';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name on Card"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name on the card';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _processPayment(context);
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _processPayment(BuildContext context) async {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Processing..."),
              ],
            ),
          ),
        );
      },
    );

    // Simulate a delay for payment processing
    await Future.delayed(Duration(seconds: 3));

    // Close the loading indicator
    Navigator.pop(context);

    // Simulate payment success or failure
    bool paymentSuccess = true; // Change this to simulate failure

    // Show payment result
    Get.snackbar(
      paymentSuccess ? "Payment Successful" : "Payment Failed",
      paymentSuccess
          ? "Your payment was processed successfully."
          : "There was an issue processing your payment. Please try again.",
      backgroundColor: paymentSuccess ? Colors.green : Colors.red,
      colorText: Colors.white,
      duration: Duration(seconds: 1),
    );

    if (paymentSuccess) {
      // Navigate back to the cart screen and clear the cart
      await Get.find<CartController>().clearCart();
      Get.to(()=>HomeScreen()); // Go back to the previous screen
    //  Get.find<CartController>().clearCart(); // Clear the cart
    }
  }
}
