import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/tile_component_pages/prescriptions_list.dart';


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
              PrescriptionsList(
                prescriptions: profileData.prescriptions,
              ),
              Text(profileData.prescriptions.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
