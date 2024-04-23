import 'dart:io';

import 'package:flutter/material.dart';

class ReportPhotosList extends StatefulWidget {
  final List<String> reports;

  ReportPhotosList({required this.reports});

  @override
  _ReportPhotosListState createState() => _ReportPhotosListState();
}

class _ReportPhotosListState extends State<ReportPhotosList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: widget.reports.map((report) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
