import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/AuthGate.dart';
import 'package:patientmobileapplication/features/onboarding/signin/ui/signin_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    _navigateToHomeScreen();
  }


  Future<void> _navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.to(AuthGate());

    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Simulate an asynchronous operation
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Navigate to the home screen after the delay
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Get.to(AuthGate());

            });
          }

          return Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SvgPicture.asset('assets/logo/LifePillLogo.svg'),
                Image.asset('assets/images/logo.png'),
              ],
            ),
          );
        },
      ),
    );
  }
}
