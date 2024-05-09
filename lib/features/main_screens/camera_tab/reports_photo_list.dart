import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class ReportPhotosList extends StatefulWidget {
  final List<String> reports;

  ReportPhotosList({required this.reports});

  @override
  _ReportPhotosListState createState() => _ReportPhotosListState();
}

class _ReportPhotosListState extends State<ReportPhotosList> {
  final List<String> formattedTimeList = [];
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
      // Extract the date time and image bytes from the data element
      String dateTime =
          imageData[0].toString(); // Assuming date time is stored at index 0
      Uint8List imageBytes = Uint8List.fromList(imageData[1]
          .cast<int>()); // Assuming image bytes are stored at index 1

      // Convert the string date and time to DateTime object
      DateTime time = DateTime.parse(dateTime);

      // Format the DateTime object as desired
      String formattedTime = DateFormat('yyyy-MM-dd | HH:mm:ss').format(time);

      final image = Image.memory(
        imageBytes,
        fit: BoxFit.fitWidth,
      );

      widgets.add(image); // Add image to the list

      formattedTimeList.add(formattedTime); // Add formatted time to the list
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Created: ${formattedTimeList[widgetList.indexOf(widget)]}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
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
                    child: widget, // Use the widget directly
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
