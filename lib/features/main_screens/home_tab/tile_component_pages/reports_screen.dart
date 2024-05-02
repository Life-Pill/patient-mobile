import 'package:flutter/material.dart';

import 'package:patientmobileapplication/features/data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/reports_photo_list.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReportPhotosList(reports: profileData.reports),
          ],
        ),
      ),
    );
  }
}
