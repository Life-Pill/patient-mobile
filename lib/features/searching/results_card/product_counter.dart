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
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: count > 0 ? Colors.black : Colors.grey,
            
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
          SizedBox(width: 10),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.add),
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