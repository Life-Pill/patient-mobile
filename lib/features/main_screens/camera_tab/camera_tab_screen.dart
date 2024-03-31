// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_tab_tile.dart';

import 'package:patientmobileapplication/features/main_screens/home_tab/components/home_tile.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/components/search_bar.dart';

class CameraTabScreen extends StatefulWidget {
  const CameraTabScreen({Key? key}) : super(key: key);

  @override
  State<CameraTabScreen> createState() => _CameraTabScreenState();
}

class _CameraTabScreenState extends State<CameraTabScreen> {
  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Do something with the picked image
      print(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  void _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Do something with the picked image
      print(pickedFile.path);
    } else {
      print('No image selected.');
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
                  Container(
                    height: 200.0,
                    padding:
                        EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36.0),
                        bottomRight: Radius.circular(36.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(current_user.img),
                                      radius: 25.0,
                                    ),
                                    backgroundColor: Colors.white,
                                    radius: 30.0),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.pin_drop_outlined,
                                          size: 15.0,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          " ${current_user.address}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFFDFDFC),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Hello, ${current_user.name}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFFDFDFC),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.notification_add_outlined,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Your Reports",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFDFDFC),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            onPressed: _openCamera, child: Text("Open Camera")),
                        ElevatedButton(
                            onPressed: _openGallery,
                            child: Text("Open Gallery")),
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
