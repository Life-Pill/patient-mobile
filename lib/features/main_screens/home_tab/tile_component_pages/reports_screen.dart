// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/reports_photo_list.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_tab_tile.dart';

import 'package:patientmobileapplication/features/main_screens/home_tab/components/home_tile.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/components/search_bar.dart';


class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final Profile profileData = Profile();

  Profile current_user = new Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("data"),
                  ReportPhotosList(reports: profileData.reports),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
