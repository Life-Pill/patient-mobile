// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:patientmobileapplication/features/data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/signin_screen.dart';

import 'package:patientmobileapplication/features/searching/search_results/ui/search_tabs.dart';
import 'package:patientmobileapplication/features/sub_screens/privacy_policy_screen.dart';
import 'package:patientmobileapplication/features/sub_screens/profile_edit_screen.dart';
import 'package:patientmobileapplication/features/sub_screens/terms_and_conditions_screen.dart';

import '../../components/account_option_btn.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
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
                  TopNavBar(NeedSearchBar: false, TabName: "Profile Details"),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Account",
                          style: GoogleFonts.roboto(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ProfileEditScreen());
                          },
                          child: AccountOptionButton(
                              btnIcon: Icons.account_circle_outlined,
                              btnText: "Your profile"),
                        ),
                        AccountOptionButton(
                            btnIcon: Icons.credit_card,
                            btnText: "Payment methods"),
                        AccountOptionButton(
                            btnIcon: Icons.password,
                            btnText: "Change Password"),
                        AccountOptionButton(
                            btnIcon: Icons.settings, btnText: "Settings"),
                        Text(
                          "General",
                          style: GoogleFonts.roboto(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(TermsnConditions());
                          },
                          child: AccountOptionButton(
                              btnIcon: Icons.account_circle_outlined,
                              btnText: "Terms & Conditions"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(PrivacyPolicy());
                          },
                          child: AccountOptionButton(
                              btnIcon: Icons.credit_card,
                              btnText: "Privacy Policy"),
                        ),
                        AccountOptionButton(
                            btnIcon: Icons.call, btnText: "Customer Services"),
                        GestureDetector(
                          onTap: () {
                            //   _logout(
                            //       context); // Call logout function when the button is tapped
                          },
                          child: AccountOptionButton(
                              btnIcon: Icons.logout_outlined,
                              btnText: "Logout"),
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

  // void _logout(BuildContext context) async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   await googleSignIn.signOut();
  //   await FirebaseAuth.instance.signOut(); // Sign out the user
  //   Get.to(SignInPage());
  // }
}
