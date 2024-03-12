import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/onboarding/check_email/ui/check_email_screen.dart';
import 'package:patientmobileapplication/features/onboarding/otp/ui/otp.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/signin_screen.dart';
import 'package:patientmobileapplication/global/global.dart';

import '../../components/top_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _submit() {
    firebaseAuth
        .sendPasswordResetEmail(email: emailTextEditingController.text.trim())
        .then((value) {
      Get.snackbar('We have sent you an email to recover password', 'Please check email',
            backgroundColor: Colors.green.shade200);
    }).onError(
      (error, stackTrace) {
        Get.snackbar('Error Occured', error.toString(),
            backgroundColor: Colors.red.shade200);
      
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
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
                    TextFormField(
                       inputFormatters: [
                                LengthLimitingTextInputFormatter(100)
                              ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email address',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          
                          return "Email can't be empty";
                        }
                        if (EmailValidator.validate(text) == true) {
                          return null;
                        }
                        if (text.length < 2) {
                          
                          return "Please enter a valid Email";
                        }
                        if (text.length > 99) {
                          
                        
                          return "Email cannot be more than 100 letters";
                        }
                          return "Please enter a valid Email";
                      },
                      onChanged: (text) => setState(() {
                        emailTextEditingController.text = text;
                      }),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    SizedBox(
                      height: 56.0,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          _submit();
                        },
                        child: Text(
                          "Send reset password link",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Set the background color
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
