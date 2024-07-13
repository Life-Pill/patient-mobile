import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Data/apiLinks.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvcController = TextEditingController();
  final _nameController = TextEditingController();
  String? _paymentIntentClientSecret;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvcController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _createPaymentIntent() async {
    try {
      final response = await http.post(
        Uri.parse(StripePaymentIntentAPI),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'amount': 5000, // Amount in cents
          'currency': 'usd',
        }),
      );

      final data = json.decode(response.body);
      setState(() {
        _paymentIntentClientSecret = data['paymentIntent'];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating payment intent: $e')),
      );
    }
  }

  Future<void> _handlePayPress() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_paymentIntentClientSecret == null) {
      await _createPaymentIntent();
      if (_paymentIntentClientSecret == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create payment intent')),
        );
        return;
      }
    }

    try {
      final cardDetails = {
        'number': _cardNumberController.text.replaceAll(RegExp(r'[^0-9]'), ''),
        'cvc': _cvcController.text,
        'name': _nameController.text,
        'expiryMonth': _expiryController.text.split('/')[0],
        'expiryYear': '20' + _expiryController.text.split('/')[1],
      };

      final billingDetails = BillingDetails(
        name: cardDetails['name'],
      );

      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: _paymentIntentClientSecret!,
        data: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: billingDetails,
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment successful!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
             
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter card number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _expiryController,
                decoration: InputDecoration(labelText: 'Expiry (MM/YY)'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter expiry date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cvcController,
                decoration: InputDecoration(labelText: 'CVC'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter CVC';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name on Card'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name on card';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handlePayPress,
                child: Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
