import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/tile_component_pages/prescriptions_list.dart';
import 'package:patientmobileapplication/features/main_screens/profile_data/profile_data.dart';

class PrescriptionsListScreen extends StatelessWidget {
  final ProfileData profileData = ProfileData();
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
              PrescriptionsList(
                prescriptions: profileData.currentUser.prescriptions,
              ),
              Text(profileData.currentUser.prescriptions.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
