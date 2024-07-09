import 'dart:io';
import 'package:flutter/material.dart';

class PrescriptionsList extends StatefulWidget {
  final List<Map<String, String>> prescriptions; // Update type to List of Maps

  PrescriptionsList({required this.prescriptions});

  @override
  _PrescriptionsListState createState() => _PrescriptionsListState();
}

class _PrescriptionsListState extends State<PrescriptionsList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: widget.prescriptions.map((prescription) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.file(
                      File(prescription['path']!), // Get path from map
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  if (prescription['message'] != null && prescription['message']!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        prescription['message']!, // Get message from map
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
