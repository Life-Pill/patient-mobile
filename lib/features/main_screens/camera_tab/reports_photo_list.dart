import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ReportPhotosList extends StatefulWidget {
  final List<String> reports;

  ReportPhotosList({required this.reports});

  @override
  _ReportPhotosListState createState() => _ReportPhotosListState();
}

class _ReportPhotosListState extends State<ReportPhotosList> {
  late Box<List<dynamic>> imageBox;
  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
    _openImageBox();
  }

  Future<void> _openImageBox() async {
    imageBox = await Hive.openBox<List<dynamic>>('reportsImageBox');
    _loadImages();
    imageBox.watch().listen((event) {
      _loadImages();
    });
  }

  Future<void> _loadImages() async {
    final List<List<dynamic>> imageDataList = imageBox.values.toList();
    final List<Widget> widgets = [];
    for (final imageData in imageDataList) {
      final firstByte = imageData.first;
      if (firstByte is int) {
        final image = Image.memory(
          Uint8List.fromList(imageData.cast<int>()),
          fit: BoxFit.fitWidth,
        );
        widgets.add(image);
      // } else if (firstByte is String && firstByte == 'pdf') {
      //   final pdfData = imageData.last;
      //   final tempDir = await getTemporaryDirectory();
      //   final file = File('${tempDir.path}/temp.pdf');
      //   await file.writeAsBytes(pdfData.cast<int>());
      //   final pdfViewer = await PDFDocument.fromFile(file);
      //   final pdfWidget = PDFViewer(
      //     document: pdfViewer,
      //     lazyLoad: false, // Preload all pages
      //     scrollDirection: Axis.vertical, // Scroll vertically
      //   );
      //   widgets.add(pdfWidget);
       }
    }
    setState(() {
      widgetList = widgets;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: widgetList.map((widget) {
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
                child: widget,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
