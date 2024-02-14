import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/onboarding/forgot_password/ui/forgot_password_screen.dart';
import 'package:patientmobileapplication/features/searching/search_results/ui/search_results_screen.dart';
import 'package:sign_button/sign_button.dart';

import '../../../../utilities/styles.dart';
import '../../signup/ui/signup_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),

                // tagline
                Text("Sign in to locate your hope with us ..."),

                const SizedBox(height: 16),

                // Email
                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF1F4FF),
                    labelText: 'E-mail',
                  ),
                ),

                const SizedBox(height: 16),

                // Password
                TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF1F4FF),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        }),
                  ),
                ),

                const SizedBox(height: 16),

                // forgot password
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(ForgotPassword());

                        print("Forgot Password");
                      },
                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Button
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(SearchResults());

                    },
                    style: AppStyles.signInButton,
                    child: Text(
                      'Sign In',
                      style: AppStyles.buttonTextStyle,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Text
                RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // TODO: Implement the Sign In logic here
                            // Navigate to the Sign In screen
                            Get.to(SignUpPage());

                          },
                      ),
                    ])),

                const SizedBox(height: 16),

                // Divider with line
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            Text("OR", style: TextStyle(color: Colors.black54)),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                SignInButton(
                    buttonType: ButtonType.google,
                    btnText: 'Sign in with Google',
                    onPressed: () {
                      print('click');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
