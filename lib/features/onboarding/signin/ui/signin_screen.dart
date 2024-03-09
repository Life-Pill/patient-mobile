import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';
import 'package:patientmobileapplication/features/onboarding/forgot_password/ui/forgot_password_screen.dart';
import 'package:patientmobileapplication/features/onboarding/signup/ui/signup_screen.dart';
import 'package:patientmobileapplication/global/global.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailTextEditingController = TextEditingController();
    final passwordTextEditingController = TextEditingController();

    bool _passwordVisible = false;
   

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

         print( "Successfully LoggedIn");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => HomeScreen(),
          ),
        );
      }).catchError(
        (errorMessage) {
          print( "Error occured: \n $errorMessage");
        },
      );
      print( "Not all field are valid");
    }
  }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text("Sign in to locate your hope with us ..."),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
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
                      return "Email cannot be more than 100 characters";
                    } else {
                      return "Incorrect Email";
                    }
                  },
                  onChanged: (text) => setState(() {
                    emailTextEditingController.text = text;
                  }),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF1F4FF),
                    labelText: 'Password',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Password can't be emty";
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
                SizedBox(height: 16),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                       Get.to(ForgotPassword());
                      },
                      child: Text(
                        'Forgot Password?',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      _submit();
                    },
                    child: Text('Sign In'),
                  ),
                ),
                SizedBox(height: 16),
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
                            Get.to(SignUpPage());
                          },
                      ),
                    ],
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
