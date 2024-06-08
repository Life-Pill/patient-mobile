import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/photo_opened_screen.dart';

class ReportPhotosList extends StatefulWidget {
  final List<String> reports;

  ReportPhotosList({required this.reports});

  @override
  _ReportPhotosListState createState() => _ReportPhotosListState();
}

class _ReportPhotosListState extends State<ReportPhotosList> {
  final List<String> formattedTimeList = [];
  late Box<List<dynamic>> imageBox;
  List<Uint8List> imageBytesList = [];

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
    final List<Uint8List> bytesList = [];

    for (final imageData in imageDataList) {
      // Extract the date time and image bytes from the data element
      String dateTime = imageData[0].toString(); // Assuming date time is stored at index 0
      Uint8List imageBytes = Uint8List.fromList(imageData[1].cast<int>()); // Assuming image bytes are stored at index 1

      // Convert the string date and time to DateTime object
      DateTime time = DateTime.parse(dateTime);

      // Format the DateTime object as desired
      String formattedTime = DateFormat('yyyy-MM-dd | HH:mm:ss').format(time);

      bytesList.add(imageBytes); // Add image bytes to the list
      formattedTimeList.add(formattedTime); // Add formatted time to the list
    }

    setState(() {
      imageBytesList = bytesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: imageBytesList.map((imageBytes) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Created: ${formattedTimeList[imageBytesList.indexOf(imageBytes)]}',
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
                  child: GestureDetector(
                    onTap: () {
                      print("tapped on image");
                      Get.to(PhotoOpenScreen(imageBytes: imageBytes));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.memory(
                        imageBytes,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
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
