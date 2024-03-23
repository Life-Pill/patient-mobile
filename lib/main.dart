import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/AuthGate.dart';
import 'package:patientmobileapplication/features/onboarding/splash/ui/splash_screen.dart';
import 'package:patientmobileapplication/firebase_options.dart';


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


        home: SplashScreen(),

//home:  AuthGate(),
      //home: HomeScreen(),
      //home: SignUpPage(),
      //home: SignInPage(),
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
