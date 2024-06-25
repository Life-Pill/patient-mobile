import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/components/home_tile.dart';
import 'package:patientmobileapplication/features/sub_screens/prescriptions_photo_list.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerServicesScreen extends StatelessWidget {
  final Profile profileData = Profile();
  CustomerServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Service'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [

              GestureDetector(
                onTap: (){_makePhoneCall("0771234567");},
                child: Container(
                  width: 250.0,
                  child: HomeTile(
                    icon: Icons.call,
                    title: "Main Hotline",
                    description: "0771234567",
                    bgcolor: Colors.greenAccent.shade200,
                    iconColor: Colors.blueAccent.shade200,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){_makePhoneCall("0111234555");},
                child: Container(
                  width: 250.0,
                  child: HomeTile(
                    icon: Icons.call,
                    title: "Customer inquiries",
                    description: "0111234555",
                    bgcolor: Colors.greenAccent.shade200,
                    iconColor: Colors.blueAccent.shade200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    print("Call btn clicked");
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

}
