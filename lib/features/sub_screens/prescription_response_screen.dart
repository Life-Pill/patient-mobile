import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/components/home_tile.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/photo_opened_screen.dart';
import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';

class PrescriptionResponseScreen extends StatefulWidget {
  @override
  _PrescriptionResponseScreenState createState() => _PrescriptionResponseScreenState();
}

class _PrescriptionResponseScreenState extends State<PrescriptionResponseScreen> {
  final List<String> formattedTimeList = [];
  late Box<List<dynamic>> prescriptionsBox;
  List<Uint8List> imageBytesList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _openPrescriptionsBox();
  }

  Future<void> _openPrescriptionsBox() async {
    prescriptionsBox = await Hive.openBox<List<dynamic>>('prescriptionsImageBox');
    await _loadImages();
    await Future.delayed(Duration(seconds: 2)); // Delay for 3 seconds
    setState(() {
      _loading = false;
    });
  }

  Future<void> _loadImages() async {
    final List<List<dynamic>> imageDataList = prescriptionsBox.values.toList();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          TopNavBar(
            NeedSearchBar: false,
            TabName: "Medicine available pharmacies",
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeTile(
              icon: Icons.pin_drop,
              title: "Line One Pharmacy, Branch 3",
              description: "",
              bgcolor: Colors.blue.shade200,
              iconColor: Colors.orangeAccent.shade200,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Display the last image
                  if (imageBytesList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Created: ${formattedTimeList.last}',
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
                                Get.to(() => PhotoOpenScreen(imageBytes: imageBytesList.last));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.memory(
                                  imageBytesList.last,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                ],
              ),
            ),

          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size(220, 50),
              backgroundColor: Colors.greenAccent.shade200,
            ),
            onPressed: () {
              Get.to(() =>HomeScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Space between icon and text
                Text("Go Back to Home Page"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
