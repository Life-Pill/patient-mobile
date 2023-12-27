import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 80.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xFFD6DFFF),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/otp_message_icon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Text(
                'Enter OTP',
                style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Enter the OTP code we just sent to',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Phone Number',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 32.0,
              ),

              //OTP entering fields
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
                height: 20.0,
              ),
              RichText(
                  text: TextSpan(
                      text: "Didn't get OTP? ",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      children: [
                    TextSpan(
                      text: ' Resend OTP',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        print("Resend OTP clicked");
                          // TODO: Implement the Resend OTP logic here
                        },
                    ),
                  ])),
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
    );
  }
}
