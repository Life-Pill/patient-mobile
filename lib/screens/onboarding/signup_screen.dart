import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

import '../../utilities/styles.dart';
import 'signin_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;

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
                  "Create Account",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),

                // tagline
                Text("Create an account to locate your hope with us ..."),

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

                // Confirm Password
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF1F4FF),
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        }),
                  ),
                ),

                const SizedBox(height: 16),

                // Button
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement your button logic here
                    },
                    style: AppStyles.signInButton,
                    child: Text(
                      'Sign Up',
                      style: AppStyles.buttonTextStyle,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Text
                RichText(
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // TODO: Implement the Sign In logic here
                            // Navigate to the Sign In screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                              ),
                            );
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
                  buttonSize: ButtonSize.small,
                    buttonType: ButtonType.google,
                    btnText: 'Sign in with Google',
                    onPressed: () {
                      print('click');
                    }),

                const SizedBox(height: 16),

                // Checkbox with Terms of Service and Privacy Policy
                Row(
                  children: [
                    Checkbox(
                      value: _agreedToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreedToTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print("Show Policies");
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
