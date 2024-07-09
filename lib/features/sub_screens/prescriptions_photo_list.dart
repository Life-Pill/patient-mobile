import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/photo_opened_screen.dart';

class PrescriptionPhotosList extends StatefulWidget {

   List<Map<String, String>> prescriptions = [];

  PrescriptionPhotosList({required this.prescriptions});

  @override
  _PrescriptionPhotosListState createState() => _PrescriptionPhotosListState();
}

class _PrescriptionPhotosListState extends State<PrescriptionPhotosList> {
  late Box<List<dynamic>> imageBox;
  List<Map<String, dynamic>> imageDetailsList = [];

  @override
  void initState() {
    super.initState();
    _openImageBox();
  }

  Future<void> _openImageBox() async {
    imageBox = await Hive.openBox<List<dynamic>>('prescriptionsImageBox');
    _loadImages();
    imageBox.watch().listen((event) {
      _loadImages();
    });
  }

  Future<void> _loadImages() async {
    final List<List<dynamic>> imageDataList = imageBox.values.toList();

    final List<Map<String, dynamic>> detailsList = [];

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

      detailsList.add({
        'formattedTime': formattedTime,
        'imageBytes': imageBytes,
      });
    }
    setState(() {
      imageDetailsList = detailsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: imageDetailsList.map((details) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Created: ${details['formattedTime']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    print("tapped on image");
                    Get.to(() => PhotoOpenScreen(imageBytes: details['imageBytes']));
                  },
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
                      child: Image.memory(
                        details['imageBytes'],
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
