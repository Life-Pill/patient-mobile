import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/onboarding/check_email/ui/check_email_screen.dart';
import 'package:patientmobileapplication/features/onboarding/forgot_password/ui/forgot_password_screen.dart';
import 'package:patientmobileapplication/features/onboarding/otp/ui/otp.dart';
import 'package:patientmobileapplication/features/onboarding/password_changed/ui/password_changed.dart';
import 'package:patientmobileapplication/features/onboarding/reset_password/ui/reset_password.dart';

import 'package:patientmobileapplication/features/searching/search_results/ui/search_results_screen.dart';
import 'package:patientmobileapplication/firebase_options.dart';


import 'features/main_screens/main_home/ui/main_home_screen.dart';
import 'features/onboarding/signin/ui/signin_screen.dart';
import 'features/onboarding/signup/ui/signup_screen.dart';

import 'features/onboarding/splash/ui/splash_screen.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(39, 124, 244, 1),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),


        //home: SplashScreen()


      //home: HomeScreen(),
      //home: SignUpPage(),
      home: SignInPage(),
      //home: ForgotPassword(),
      //home:CheckEmail(),
      //home:OTPScreen(),
      //home:ResetPassword(),
     // home: PasswordChanged(),
      //home:SearchResults(),

      //home: ViewProfile(),

    );
  }
}
