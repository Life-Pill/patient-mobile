
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';
import 'package:patientmobileapplication/features/onboarding/forgot_password/ui/forgot_password_screen.dart';
import 'package:patientmobileapplication/global/global.dart';
import 'package:patientmobileapplication/services/auth_services.dart';
import 'package:sign_button/sign_button.dart';

import '../../../../utilities/styles.dart';
import '../../signup/ui/signup_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  bool _passwordNotVisible = true;

  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    // validate all the form field
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      )
          .then((auth) async {
        currentUser = auth.user;

        Get.snackbar('Logged in Successfully', 'Welcome',
            backgroundColor: Colors.green.shade200);
        Get.to(() =>HomeScreen());

      }).catchError(
        (errorMessage) {
          print("Error occured: \n $errorMessage");
          Get.snackbar(
              'Invalid Credentials', 'Try again with valid credentials',
              backgroundColor: Colors.red.shade200);
        },
      );
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
              child: Form(
                key: _formKey,
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
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
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
                        if (text.length < 2) {
                          return "Please enter a valid Email";
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
                      obscureText: _passwordNotVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF1F4FF),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            icon: Icon(_passwordNotVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passwordNotVisible = !_passwordNotVisible;
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
                        passwordTextEditingController.text = text;
                      }),
                    ),

                    const SizedBox(height: 16),

                    // forgot password
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ForgotPasswordScreen());
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
                          print("Signin btn clicked");
                          _submit();
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
                                // Navigate to the Sign up screen
                                Get.to(() => SignUpPage());
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
                        buttonType: ButtonType.google,
                        btnText: 'Sign in with Google',
                        onPressed: () =>AuthService().signInWithGoogle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
