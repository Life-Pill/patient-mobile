
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:patientmobileapplication/AuthGate.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';
import 'package:patientmobileapplication/features/onboarding/splash/ui/splash_screen.dart';
import 'package:patientmobileapplication/firebase_options.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );
   // Create an instance of ProfileController to fetch profile data
  final profileController = Get.put(ProfileController());
  
  // Fetch profile data
  print('Fetching profile data...');
  await profileController.fetchProfileData();
  print('Profile data fetched successfully!');
 
  // Initialize Hive
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // Check if the box exists
  final bool prescriptionsBoxExists = await Hive.boxExists('prescriptionsBox');

   // Open the box or create it if it doesn't exist
  Box<List<int>> presBox;
  if (prescriptionsBoxExists) {
    presBox = await Hive.openBox<List<int>>('prescriptionsBox');
  } else {
    presBox = await Hive.openBox<List<int>>('prescriptionsBox');
  }
  // Check if the box exists
  final bool reportsBoxExists = await Hive.boxExists('reportsBox');

   // Open the box or create it if it doesn't exist
  Box<List<int>> reportsBox;
  if (prescriptionsBoxExists) {
    reportsBox = await Hive.openBox<List<int>>('reportsBox');
  } else {
    reportsBox = await Hive.openBox<List<int>>('reportsBox');
  }


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


       // home: SplashScreen(),

//home:  AuthGate(),
      home: HomeScreen(),
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
