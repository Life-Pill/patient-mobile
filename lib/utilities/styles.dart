import 'package:flutter/material.dart';

class AppStyles {
  static final ButtonStyle signInButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static final TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
}
