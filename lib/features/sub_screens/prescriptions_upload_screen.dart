import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as diodart;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patientmobileapplication/features/Data/apiLinks.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';

import 'package:http/http.dart' as http;

import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';
import 'package:patientmobileapplication/features/sub_screens/prescriptions_photo_list.dart';

class PrescriptionsUploadScreen extends StatefulWidget {
  const PrescriptionsUploadScreen({super.key});

  @override
  State<PrescriptionsUploadScreen> createState() =>
      _PrescriptionsUploadScreenState();
}

class _PrescriptionsUploadScreenState extends State<PrescriptionsUploadScreen> {
  @override
  void initState() {
    super.initState();
    _openPrescriptionImageBox();
  }

  late Box<List<dynamic>> prescriptionsImageBox;
  final Profile profileData = Profile();

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        profileData.prescriptions.add(pickedFile.path);
      });
      print(pickedFile.path);
      print("All reports: ${profileData.prescriptions}");
      await _uploadImage(File(pickedFile.path));
      await _saveImageInHive(File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  void _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileData.prescriptions.add(pickedFile.path);
      });
      print(pickedFile.path);
      print("All prescriptions: ${profileData.prescriptions}");

      await _saveImageInHive(File(pickedFile.path));
      await _uploadImage(File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    try {
      // Create Dio instance
      diodart.Dio dio = diodart.Dio();

      // Determine content type based on file extension
      MediaType mediaType = MediaType('image', 'jpeg'); // Default to JPEG
      if (imageFile.path.toLowerCase().endsWith('.png')) {
        mediaType = MediaType('image', 'png');
      } else if (imageFile.path.toLowerCase().endsWith('.jpg')) {
        mediaType = MediaType('image', 'jpg');
      }

      // Create FormData object
      diodart.FormData formData = diodart.FormData.fromMap({
        'file': await diodart.MultipartFile.fromFile(
          imageFile.path,
          filename:
              'image.${mediaType.subtype}', // Specify filename with correct extension
          contentType: mediaType, // Specify content type using MediaType
        ),
      });

      // Send POST request with FormData
      diodart.Response response = await dio.post(
        CustomerPrescriptionsAPI,
        data: formData,
      );

      // Handle response
      if (response.statusCode == 200) {
        print('Prescription uploaded successfully: ${response.data}');
      } else {
        print('Error uploading Prescription: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading Prescription: $error');
    }
  }

  Future<void> _saveImageInHive(File imageFile) async {
    try {
      List<int> bytes = await imageFile.readAsBytes();

      String dateTime = DateTime.timestamp().toString();

      // Save the image data along with the date and time
      final data = [dateTime, bytes];

      // Save the data in the prescriptionsImageBox
      await prescriptionsImageBox.add(data);
      print('Prescription saved in Hive');
    } catch (e) {
      print('Error saving Prescription in Hive: $e');
    }
  }

  Future<void> _openPrescriptionImageBox() async {
    prescriptionsImageBox = Hive.box('prescriptionsImageBox');
  }

  Future<void> _resetHiveBoxes() async {
    // Close existing boxes if they are open
    if (prescriptionsImageBox.isOpen) await prescriptionsImageBox.close();

    // Delete existing Hive database files from disk
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final hiveDirectory = Directory(appDocumentDir.path);
    hiveDirectory.deleteSync(recursive: true);

    // Open new Hive boxes
    prescriptionsImageBox =
        await Hive.openBox<List<dynamic>>('prescriptionsImageBox');

    print('Hive boxes reset');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 60.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopNavBar(
                    NeedSearchBar: false,
                    TabName: "Search for a Medicine",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Send us your prescription to us by taking a picture or uploading it from your gallery",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: _openCamera,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt), // Icon added here
                                  SizedBox(
                                      width: 10), // Space between icon and text
                                  Text("Open\nCamera"),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _openGallery,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons
                                      .photo_size_select_actual_rounded), // Icon added here
                                  SizedBox(
                                      width: 10), // Space between icon and text
                                  Text("Open\nGallery"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: _resetHiveBoxes,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Space between icon and text
                              Text("Reset Hive Boxes"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        PrescriptionPhotosList(
                            prescriptions: profileData.prescriptions),
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
              Get.to(HomeScreen());
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
