import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';
import 'package:patientmobileapplication/features/onboarding/forgot_password/ui/forgot_password_screen.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/def_signin.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/prsignin.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/signin_screen.dart';


class AuthGate extends StatelessWidget {
 const AuthGate({super.key});

 @override
 Widget build(BuildContext context) {
   return StreamBuilder<User?>(
     stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
       if (!snapshot.hasData) {
         return const SignInPage();
       }
       return const HomeScreen();
     },
   );
 }
}