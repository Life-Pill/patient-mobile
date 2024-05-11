// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;
// import 'package:patientmobileapplication/features/Data/apiLinks.dart';
// import 'package:patientmobileapplication/features/Data/profile_data.dart';

// // Create a mock class for http.Client
// class MockClient extends Mock implements http.Client {
//   @override
//   Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
//     return Future.value(http.Response('', 200)); // Returning an empty response
//   }
// }

// void main() {
//   late ProfileController profileController;
//   late http.Client httpClient;

//   setUp(() {
//     httpClient = MockClient();
//     profileController = ProfileController(httpClient: httpClient);
//   });

// test('Test fetchProfileData', () async {
//   // Mock API response
//   when(httpClient.get(Uri.parse(CustomerDetailsAPI)))
//       .thenAnswer((_) async => http.Response(
//           '{"customerFullName":"John Doe","customerEmail":"john@example.com","customerAddressStreet":"123 Street","customerAddressCity":"City","customerAddressDistrict":"District","customerMobileNumber":"1234567890"}',
//           200));

//   // Call the method
//   await profileController.fetchProfileData();

//   // Verify if profile data is updated correctly
//   expect(profileController.currentUser.value.name, 'John Doe');
//   expect(profileController.currentUser.value.email, 'john@example.com');
//   expect(profileController.currentUser.value.addressStreet, '123 Street');
//   expect(profileController.currentUser.value.addressCity, 'City');
//   expect(profileController.currentUser.value.addressDistrict, 'District');
//   expect(profileController.currentUser.value.phoneNumber, '1234567890');
// });

//   test('Test updateProfileAPI', () async {
//     // Mock API response
//     final response = http.Response('{"message":"Success"}', 200);
//     when(httpClient.put(
//       Uri.parse(CustomerDetailsAPI),
//       headers: anyNamed('headers'),
//       body: anyNamed('body'),
//     )).thenAnswer((_) async => response);

//     // Call the method
//     await profileController.updateProfileAPI(
//       name: 'Jane Doe',
//       email: 'jane@example.com',
//       phoneNumber: '9876543210',
//       addressStreet: '456 Street',
//       addressCity: 'City',
//       addressDistrict: 'District',
//     );

//     // Verify if profile data is updated correctly
//     expect(profileController.currentUser.value.name, 'Jane Doe');
//     expect(profileController.currentUser.value.email, 'jane@example.com');
//     expect(profileController.currentUser.value.phoneNumber, '9876543210');
//     expect(profileController.currentUser.value.addressStreet, '456 Street');
//     expect(profileController.currentUser.value.addressCity, 'City');
//     expect(profileController.currentUser.value.addressDistrict, 'District');
//   });
// }
