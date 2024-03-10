import 'dart:math';

import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color bgcolor;
  final Color iconColor;

  const HomeTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      required this.bgcolor,
      required this.iconColor});
  @override
  Widget build(BuildContext context) {
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
          color: bgcolor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding:
            EdgeInsets.only(top: 24.0, bottom: 24.0, right: 16.0, left: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: iconColor,
              child: Icon(
                icon,
                color: Colors.black,
                size: 20.0,
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  description,
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
      ),
    );
  }
}
