import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/camera_tab_screen.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/cart_tab_screen.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/home_tab_screen.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/tile_component_pages/prescriptions_screen.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/tile_component_pages/reports_screen.dart';
import 'package:patientmobileapplication/features/main_screens/other_accounts_tab/other_accounts_screen.dart';
import 'package:patientmobileapplication/features/main_screens/view_profile_tab/ui/view_profile_screen.dart';
import 'package:patientmobileapplication/features/sub_screens/prescriptions_upload_screen.dart';
import 'package:patientmobileapplication/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Navigation test", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Tap on the "Upload Prescriptions" GestureDetector
    await tester.tap(find.text("Upload Prescriptions"));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Verify that the navigation leads to PrescriptionsUploadScreen
    expect(find.byType(PrescriptionsUploadScreen), findsOneWidget);

    // Tap on the "Go Back to Home Page" button
    await tester.tap(find.text("Go Back to Home Page"));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Verify that the navigation goes back to Home
    expect(find.byType(Home), findsOneWidget);

    // Tap on the "My Reports" tile
    await tester.tap(find.text("My Reports"));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Verify that the navigation leads to ReportsScreen
    expect(find.byType(ReportsScreen), findsOneWidget);

    // Tap on the back button in the AppBar
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Verify that the navigation goes back to Home
    expect(find.byType(Home), findsOneWidget);

    // Tap on the "Prescriptions" tile
    await tester.tap(find.text("Prescriptions"));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Verify that the navigation leads to PrescriptionsListScreen
    expect(find.byType(PrescriptionsListScreen), findsOneWidget);

    // Tap on the back button in the AppBar
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Verify that the navigation goes back to Home
    expect(find.byType(Home), findsOneWidget);

//Tab on cart tab
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(CartTabScreen), findsOneWidget);

//Tap on camera tab
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(CameraTabScreen), findsOneWidget);

//Tap on people tab
    await tester.tap(find.byIcon(Icons.people));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(OtherAccountsScreen), findsOneWidget);

//Tap on profile tab
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(ViewProfileScreen), findsOneWidget);

    //Tap on home tab
    await tester.tap(find.byIcon(Icons.home_filled));
    await tester.pumpAndSettle(Duration(seconds: 2));
    
    expect(find.byType(Home), findsOneWidget);
  });
}
