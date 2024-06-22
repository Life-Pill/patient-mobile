
import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';
import 'package:patientmobileapplication/global/global.dart';
import 'package:sign_button/sign_button.dart';

import '../../../../utilities/styles.dart';
import '../../signin/ui/signin_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final initialPasswordTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;

  final _formKey = GlobalKey<FormState>();
  void _submit() async {
    print('---- within submit function ----');

   if (_formKey.currentState == null || _formKey.currentState!.validate() ) {

      print(
          '---- within if _formKey.currentState!.validate() in submit function ----');
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      )
          .then((auth) async {
        print('---- within then in submit function ----');
        currentUser = auth.user;
        if (currentUser != null) {
          print('---- within currentUser != null in submit function ----');
          Map userMap = {
            "id": currentUser!.uid,
            "email": emailTextEditingController.text.trim(),
          };

          DatabaseReference userRef =
              FirebaseDatabase.instance.ref().child("users");
          userRef.child(currentUser!.uid).set(userMap);
        } else {
           print('================User authentication failed=================');
        }
        print(
            '---- within before signed in successfully snackbar submit function ----');
        Get.snackbar('Signed in Successfully', 'Welcome',
            backgroundColor: Colors.green.shade200);
        Get.to(() => HomeScreen());
        return;
      }).catchError(
        (errorMessage) {
          print('---- within catchError in submit function ----');

          Get.snackbar('Error occurred', 'Try again',
              backgroundColor: Colors.redAccent.shade200);
          print("Error occurred in registering: \n $errorMessage");
        },
      );
    } else {
      print('---- within else before all fields valid in submit function ----');
      Get.snackbar('Not all fields are valid', 'Try again',
          backgroundColor: Colors.redAccent.shade200);
    }
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Email can't be empty";
                      }
                      if (EmailValidator.validate(text) == true) {
                        return null;
                      }

                      if (text.length > 99) {
                        return "Email cannot be more than 100";
                      }
                      return "Please enter a valid Email";
                    },
                    onChanged: (text) => setState(() {
                      emailTextEditingController.text = text;
                    }),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (EmailValidator.validate(text) == true) {
                        return null;
                      }
                      if (text.length < 6) {
                        return "Please enter a valid Password";
                      }
                      if (text.length > 49) {
                        return "Password cannot be more than 50";
                      }
                      return null;
                    },
                    onChanged: (text) => setState(() {
                      initialPasswordTextEditingController.text = text;
                    }),
                  ),

                  const SizedBox(height: 16),

                  // Confirm Password
                  TextFormField(
                    obscureText: _obscureConfirmPassword,
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
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          }),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Confirm Password can't be empty";
                      }
                      if (text != initialPasswordTextEditingController.text) {
                        return "Passwords do not match";
                      }

                      if (text.length < 6) {
                        return "Please enter a valid Password";
                      }
                      if (text.length > 49) {
                        return "Password cannot be more than 50";
                      }
                      return null;
                    },
                    onChanged: (text) => setState(() {
                      passwordTextEditingController.text = text;
                    }),
                  ),

                  const SizedBox(height: 16),

                  // Button
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_agreedToTerms) {
                          print("===========Submit btn clicked ============");
                          _submit();
                        } else {
                          Get.snackbar('Please agree to the terms', 'Try again',
                              backgroundColor: Colors.redAccent.shade200);
                        }
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
                              Get.to(() =>SignInPage());
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
                          child: Text("OR",
                              style: TextStyle(color: Colors.black54)),
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
      ),
    );
  }
}
