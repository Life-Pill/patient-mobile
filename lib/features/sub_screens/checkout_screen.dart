import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  CardFieldInputDetails? _card;

  Future<void> _createPaymentIntent() async {
    try {
      // Call your backend to create a PaymentIntent
      final response = await http.post(
        Uri.parse('http://localhost:4242/create-payment-intent'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CardField(
              onCardChanged: (card) {
                setState(() {
                  _card = card;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _card?.complete == true
                  ? _createPaymentIntent
                  : null,
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
