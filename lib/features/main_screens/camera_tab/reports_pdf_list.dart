import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ReportsPdfList extends StatefulWidget {
  @override
  _ReportsPdfListState createState() => _ReportsPdfListState();
}

class _ReportsPdfListState extends State<ReportsPdfList> {
  late Box<List<dynamic>> pdfBox;
  List<String> pdfNames = [];

  @override
  void initState() {
    super.initState();
    _openPdfBox();
  }

  Future<void> _openPdfBox() async {
    pdfBox = await Hive.openBox<List<dynamic>>('reportsPdfBox');
    _loadPdfNames();
    pdfBox.watch().listen((event) {
      _loadPdfNames();
    });
  }

  Future<void> _loadPdfNames() async {
    final List<List<dynamic>> pdfDataList = pdfBox.values.toList();
    final List<String> names = [];
    for (final pdfData in pdfDataList) {
      final pdfFileName = pdfData[0]; // Assuming the file name is stored at index 0
      names.add(pdfFileName.toString());
    }
    setState(() {
      pdfNames = names;
    });
  }

 @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: pdfNames.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: ListTile(
                    title: Text(pdfNames[index]),
                    // Add onTap or other functionality here if needed
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
