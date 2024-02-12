import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/onboarding/check_email/ui/check_email_screen.dart';
import 'package:patientmobileapplication/features/onboarding/otp/ui/otp.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/signin_screen.dart';

import '../../components/top_app_bar.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                          "Forgot password?",
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
                      "Don’t worry! It happens. Please enter the email associated with your account",
                      style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF61677D)),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email address",
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
                        hintText: 'Enter your email address',
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
                          Get.to(CheckEmail());
                        },
                        child: Text(
                          "Send code",
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
                  children:[RichText(
                      text: TextSpan(
                          text: "Remember password? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0

                          ),
                          children: [
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                              fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
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
