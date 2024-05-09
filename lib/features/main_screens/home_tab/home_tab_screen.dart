// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';

import 'package:patientmobileapplication/features/main_screens/home_tab/components/home_tile.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/components/search_bar.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/tile_component_pages/prescriptions_screen.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/tile_component_pages/reports_screen.dart';
import 'package:patientmobileapplication/features/sub_screens/prescriptions_upload_screen.dart';

import '../../Data/profile_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProfileController profileController = Get.put(ProfileController());
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
                    TabName: "Home",
                    NeedSearchBar: true,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PrescriptionsUploadScreen());
                          },
                          child: HomeTile(
                            icon: Icons.file_copy,
                            title: "Upload Prescriptions",
                            description: "Upload your prescription here",
                            bgcolor: Colors.greenAccent.shade200,
                            iconColor: Colors.blueAccent.shade200,
                          ),
                        ),
                        HomeTile(
                          icon: Icons.shopping_cart_outlined,
                          title: "Order History",
                          description: "View order history",
                          bgcolor: Colors.amber.shade200,
                          iconColor: Colors.greenAccent.shade200,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ReportsScreen());
                          },
                          child: HomeTile(
                            icon: Icons.file_copy,
                            title: "My Reports",
                            description: "View stored reports",
                            bgcolor: Colors.greenAccent.shade200,
                            iconColor: Colors.blueAccent.shade200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PrescriptionsListScreen());
                          },
                          child: HomeTile(
                            icon: Icons.medical_information_outlined,
                            title: "Prescriptions",
                            description: "View stored prescriptions",
                            bgcolor: Colors.lightBlue.shade200,
                            iconColor: Colors.orangeAccent.shade200,
                          ),
                        ),
                        HomeTile(
                          icon: Icons.local_pharmacy_outlined,
                          title: "Nearby Pharmacies",
                          description: "View nearby pharmacies",
                          bgcolor: Colors.orangeAccent.shade200,
                          iconColor: Colors.greenAccent.shade200,
                        ),
                        HomeTile(
                          icon: Icons.notifications_active_outlined,
                          title: "Remind Me",
                          description: "Set reminders",
                          bgcolor: Colors.yellow.shade200,
                          iconColor: Colors.greenAccent.shade200,
                        ),
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
