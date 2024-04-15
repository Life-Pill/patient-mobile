import 'package:flutter/material.dart';

class CartTabTile extends StatelessWidget {
  final int medicine_count;
  final String medicine_imageUrl;
  final double price;
  final String unit;
  final String medicine_name;
  final String pharmacy_name;

  const CartTabTile(
      {super.key,
      required this.medicine_imageUrl,
      required this.price,
      required this.unit,
      required this.medicine_name,
      required this.pharmacy_name,
      required this.medicine_count});
  @override
  Widget build(BuildContext context) {
    double total_price = price * medicine_count;
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
        padding:
            EdgeInsets.only(top: 24.0, bottom: 24.0, right: 16.0, left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(medicine_imageUrl),
                  radius: 30.0,
                ),
                SizedBox(width: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine_name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      pharmacy_name,
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
                  '${medicine_count.toString()} ${unit}s',
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
