// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/Data/apiLinks.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/reports_photo_list.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class CameraTabScreen extends StatefulWidget {
  const CameraTabScreen({Key? key}) : super(key: key);

  @override
  State<CameraTabScreen> createState() => _CameraTabScreenState();
}

class _CameraTabScreenState extends State<CameraTabScreen> {
  final Profile profileData = Profile();
     late Box<List<int>> imageBox;

    @override
  void initState() {
    super.initState();
    _openImageBox();
  }

   Future<void> _openImageBox() async {
    imageBox =  Hive.box('prescriptionsBox');
  }

    Future<void> _saveImageInHive(File imageFile) async {
    List<int> bytes = await imageFile.readAsBytes();
    await imageBox.add(bytes);
    print('Image saved in Hive');
  }

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        profileData.reports.add(pickedFile.path);
      });
      print(pickedFile.path);
      print("All reports: ${profileData.reports}");
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
        profileData.reports.add(pickedFile.path);
      });
      print(pickedFile.path);
      print("All reports: ${profileData.reports}");
      await _uploadImage(File(pickedFile.path));
       await _saveImageInHive(File(pickedFile.path)); 
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(CustomerPrescriptionsAPI));
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Profile current_user = new Profile();

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
                    TabName: "Your Cart",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Add a new report by taking a picture or selecting from your gallery",
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
                          height: 20.0,
                        ),
                        ReportPhotosList(reports: profileData.reports),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
