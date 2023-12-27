import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'features/onboarding/signin/ui/signin_screen.dart';
import 'features/onboarding/signup/ui/signup_screen.dart';
import 'features/onboarding/home/ui/home_screen.dart';
import 'features/onboarding/splash/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: SignUpPage(),
      //home: SignInPage(),
    );
  }
}
