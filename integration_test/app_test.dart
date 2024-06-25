import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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


//Tap on profile tab
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(ViewProfileScreen), findsOneWidget);

    //Tap on home tab
    await tester.tap(find.byIcon(Icons.home_filled));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(Home), findsOneWidget);
  });

  testWidgets("Test profile editing and reverting changes",
      (WidgetTester tester) async {
    // Function to enter text in a text field and check if the text has been updated
    Future<void> enterTextAndCheckUpdate(
        WidgetTester tester, Finder foundWidget, String newText) async {
      while (true) {
        await tester.enterText(foundWidget, newText);
        await tester.pump();
        await tester.pump(Duration(seconds: 1));
        if (find.text(newText).evaluate().isNotEmpty) {
          break;
        }
      }
    }

    // Build the ProfileEditScreen widget
    app.main();
    await tester.pumpAndSettle(Duration(seconds: 2));

    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle(Duration(seconds: 2));

    await tester.tap(find.text("Your profile"));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Find the text fields using their keys
    final Finder nameField = find.byKey(const Key('name_field'));
    final Finder emailField = find.byKey(const Key('email_field'));
    final Finder streetField = find.byKey(const Key('address_street_field'));
    final Finder cityField = find.byKey(const Key('address_city_field'));
    final Finder districtField =
        find.byKey(const Key('address_district_field'));
    final Finder phoneNumberField = find.byKey(const Key('phone_number_field'));
    //  final Finder nicField = find.byKey(const Key('nic_field'));

    // Find the text fields for name, email, street, city, district, and phone number
    final String initialName =
        tester.widget<TextField>(nameField).controller!.text;
    final String initialEmail =
        tester.widget<TextField>(emailField).controller!.text;
    final String initialStreet =
        tester.widget<TextField>(streetField).controller!.text;
    final String initialCity =
        tester.widget<TextField>(cityField).controller!.text;
    final String initialDistrict =
        tester.widget<TextField>(districtField).controller!.text;
    final String initialPhoneNumber =
        tester.widget<TextField>(phoneNumberField).controller!.text;

    await tester.pumpAndSettle(Duration(seconds: 2));

    // Enter new values for profile details
    await enterTextAndCheckUpdate(tester, nameField, 'New Name');
    await enterTextAndCheckUpdate(tester, emailField, 'new@example.com');
    await enterTextAndCheckUpdate(tester, streetField, 'New Street');
    await enterTextAndCheckUpdate(tester, cityField, 'New City');
    await enterTextAndCheckUpdate(tester, districtField, 'New District');
    await enterTextAndCheckUpdate(tester, phoneNumberField, '1234567890');

    await tester.pumpAndSettle(Duration(seconds: 4));
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
    await tester.pumpAndSettle(Duration(seconds: 4));

    // Tap on the "Save Changes" button
    final Finder saveButton = find.byKey(const Key('save_button'));
    await tester.tap(saveButton);
    await tester.pumpAndSettle(Duration(seconds: 2));

    await tester.tap(find.text("Your profile"));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Verify that the profile details have been updated
    expect(find.text('New Name'), findsOneWidget);
    expect(find.text('new@example.com'), findsOneWidget);
    expect(find.text('New Street'), findsOneWidget);
    expect(find.text('New City'), findsOneWidget);
    expect(find.text('New District'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);

    // Revert the changes back to initial values

    await enterTextAndCheckUpdate(tester, nameField, initialName);
    await enterTextAndCheckUpdate(tester, emailField, initialEmail);
    await enterTextAndCheckUpdate(tester, streetField, initialStreet);
    await enterTextAndCheckUpdate(tester, cityField, initialCity);
    await enterTextAndCheckUpdate(tester, districtField, initialDistrict);
    await enterTextAndCheckUpdate(tester, phoneNumberField, initialPhoneNumber);


  await tester.pumpAndSettle(Duration(seconds: 4));
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
    await tester.pumpAndSettle(Duration(seconds: 4));

    // Tap on the "Save Changes" button again
    await tester.tap(saveButton);
    await tester.pumpAndSettle();

    await tester.tap(find.text("Your profile"));
    await tester.pumpAndSettle(Duration(seconds: 2));
    // Verify that the profile details have been reverted back to initial values
    expect(find.text(initialName), findsOneWidget);
    expect(find.text(initialEmail), findsOneWidget);
    expect(find.text(initialStreet), findsOneWidget);
    expect(find.text(initialCity), findsOneWidget);
    expect(find.text(initialDistrict), findsOneWidget);
    expect(find.text(initialPhoneNumber), findsOneWidget);
  });
}
