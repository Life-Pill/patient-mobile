import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/sub_screens/prescriptions_photo_list.dart';

class PrescriptionsListScreen extends StatelessWidget {
  final Profile profileData = Profile();
  PrescriptionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescriptions'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrescriptionPhotosList(prescriptions: profileData.prescriptions),
            ],
          ),
        ),
      ),
    );
  }
}
