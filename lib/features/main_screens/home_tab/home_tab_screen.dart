// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/components/account_option_btn.dart';
import 'package:patientmobileapplication/features/main_screens/profile_data/current_user.dart';

import 'package:patientmobileapplication/features/searching/search_results/ui/search_tabs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    height: 275.0,
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
                                  Icons.notifications_none,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                        AccountOptionButton(
                            btnIcon: Icons.account_circle_outlined,
                            btnText: "Your profile"),
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
                        AccountOptionButton(
                            btnIcon: Icons.account_circle_outlined,
                            btnText: "Terms & Conditions"),
                        AccountOptionButton(
                            btnIcon: Icons.credit_card,
                            btnText: "Privacy Policy"),
                        AccountOptionButton(
                            btnIcon: Icons.call, btnText: "Customer Services"),
                        AccountOptionButton(
                            btnIcon: Icons.logout_outlined, btnText: "Logout"),
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
