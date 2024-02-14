import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/onboarding/password_changed/ui/password_changed.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/signin_screen.dart';

import '../../components/top_app_bar.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TopAppBar(onBackTap: () {}),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Reset password?",
                          style: GoogleFonts.poppins(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF277CF4)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Please type something you'll remember",
                      style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF61677D)),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "New password",
                          style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF61677D)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter new password',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm new password",
                          style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF61677D)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Re-enter new password',
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    SizedBox(
                      height: 56.0,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(PasswordChanged());},
                        child: Text(
                          "Reset password",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // Set the background color
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Remember password? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                            children: [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to the Log In screen
                                Get.to(SignInPage());

                              },
                          ),
                        ])),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
