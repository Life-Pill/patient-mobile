import 'dart:io';

import 'package:flutter/material.dart';

class PrescriptionsList extends StatefulWidget {
  final List<String> prescriptions;

  PrescriptionsList({required this.prescriptions});

  @override
  _ReportPhotosListState createState() => _ReportPhotosListState();
}

class _ReportPhotosListState extends State<PrescriptionsList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: widget.prescriptions.map((report) {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.file(
                  File(report),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
