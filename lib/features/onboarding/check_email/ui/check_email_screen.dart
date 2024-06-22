import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:patientmobileapplication/features/onboarding/reset_password/ui/reset_password.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/signin_screen.dart';

import '../../components/top_app_bar.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20.0,left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TopAppBar(onBackTap: () {}),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(

                            "Please check your email",
                            style: GoogleFonts.poppins(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF277CF4)),

                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "We've sent a code to EMAIL",
                          style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF61677D)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //single otp number entering box
                        Container(
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey.shade100,
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                        Container(
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey.shade100,
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                        Container(
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey.shade100,
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                        Container(
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey.shade100,
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                        Container(
                          height: 70.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey.shade100,
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 56.0,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                      
                         // Get.to(() =>ResetPassword());
                        },
                        child: Text(
                          "Verify",
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
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Send code again in 00:20",
                      style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF61677D)),
                    ),
                  ],
                ),

                Container(
                  child: NumericKeyboard(
                    onKeyboardTap: (value) {
                      setState(() {
                        String enteredText = "";
                        enteredText += value;
                      });
                    },
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                    rightIcon: const Icon(
                      Icons.backspace_outlined,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
