import 'package:flutter/material.dart';

class ProductCounter extends StatefulWidget {
  final Function(int) onCountChange;
  final int stkCount;

  ProductCounter({required this.onCountChange, required this.stkCount});

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 25.0,
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              size: 15.0,
              Icons.remove,
              color: count > 0
                  ? Colors.black
                  : const Color.fromARGB(255, 90, 83, 83),
            ),
            onPressed: () {
              setState(() {
                if (count > 0) {
                  count--;
                  widget.onCountChange(
                      count); // Notify the parent about the count change
                }
              });
            },
          ),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 15),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 15.0,
            ),
            onPressed: () {
              setState(() {
                if (count < widget.stkCount) {
                  count++;
                  widget.onCountChange(count);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
