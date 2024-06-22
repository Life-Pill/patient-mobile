//TODO: Remove
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../signin/ui/signin_screen.dart';

// class PasswordChanged extends StatelessWidget {
//   const PasswordChanged({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Container(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image(
//                 image: AssetImage("assets/images/two_star.png"),
//                 width: 85.0,
//                 height: 85.0,
//               ),
//               SizedBox(
//                 height: 36.0,
//               ),
//               Text(
//                 "Password changed",
//                 style: GoogleFonts.poppins(
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF277CF4)),
//               ),
//               SizedBox(
//                 height: 13.0,
//               ),
//               Text(
//                 "Your password has been changed \nsuccesfully",
//                 style: GoogleFonts.poppins(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF61677D)),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 38.0,
//               ),
//               SizedBox(
//                 height: 56.0,
//                 width: double.maxFinite,
//                 child: ElevatedButton(
//                   onPressed: () {
//                    Get.to(() =>SignInPage());

//                   },
//                   child: Text(
//                     "Back to login",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.0),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue, // Set the background color
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius:
//                           BorderRadius.circular(10.0), // Set the border radius
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
