import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/Data/apiLinks.dart';
import 'package:patientmobileapplication/features/main_screens/components/custom_snackBar.dart';

class Profile {
  String name = "default";
  String email = "";
  String img = "assets/images/defaultProfilePic.png";
  // String dob = "";
  //String gender = "male";
  String addressStreet = "";
  String addressCity = "";
  String addressDistrict = "";
  String phoneNumber = "";
  String nic = "";

  List<String> reports = [];
  List<String> prescriptions = [];
}

class ProfileController extends GetxController {
  final http.Client? httpClient;

  ProfileController({http.Client? httpClient}) : this.httpClient = httpClient;
  var currentUser = Profile().obs;

  void updateProfile({
    required String name,
    required String email,
    required String addressStreet,
    required String addressCity,
    required String addressDistrict,
    required String phoneNumber,
  }) {
    currentUser.update((val) {
      val?.name = name;
      val?.email = email;
      val?.addressStreet = addressStreet;
      val?.addressCity = addressCity;
      val?.addressDistrict = addressDistrict;
      val?.phoneNumber = phoneNumber;
    });
  }

  Future<void> updateProfileAPI({
    required int customerId,
    required String name,
    required String email,
    required String phoneNumber,
    required String addressStreet,
    required String addressCity,
    required String addressDistrict,
  }) async {
    try {
      // Prepare the request body with only the required fields
      Map<dynamic, dynamic> requestBody = {
        'customerFullName': name,
        'customerEmail': email,
        'customerMobileNumber': phoneNumber,
        "customerPassword": "pwd",
        'customerAddressStreet': addressStreet,
        'customerAddressCity': addressCity,
        'customerAddressDistrict': addressDistrict,
      };

      final response = await http.put(
        Uri.parse('$CustomerDetailsAPI$customerId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // If the request is successful, update the local profile data
        updateProfile(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          addressStreet: addressStreet,
          addressCity: addressCity,
          addressDistrict: addressDistrict,
        );
        print('Profile updated successfully');
        CustomSnackBar(true,"Successful", "Profile Details Changed");
      } else {
        throw Exception('Failed to update profile: ${response.statusCode}');
      }
    } catch (error) {
      CustomSnackBar(false,'Error Occurred', 'Try again');
      throw Exception('Failed to update profile: $error');
    }
  }

  Future<void> fetchProfileData(int customerId) async {
    try {
      final response = await http.get(Uri.parse('$CustomerDetailsAPI$customerId'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        updateProfile(
          name: jsonData['customerFullName'],
          email: jsonData['customerEmail'],
          addressStreet: jsonData['customerAddressStreet'],
          addressCity: jsonData['customerAddressCity'],
          addressDistrict: jsonData['customerAddressDistrict'],
          phoneNumber: jsonData['customerMobileNumber'],
        );
        print('Name: ${currentUser.value.name}');
        print('Email: ${currentUser.value.email}');
        print('Address: ${currentUser.value.addressStreet}, ${currentUser.value.addressCity} ,${currentUser.value.addressDistrict}');
        print('Phone Number: ${currentUser.value.phoneNumber}');
      } else {
        throw Exception('Failed to load profile data');
      }
    } catch (error) {
      throw Exception('Failed to load profile data: $error');
    }
  }

  void addReport(String imagePath) {
    currentUser.value.reports.add(imagePath);
  }

  void addPrescription(String imagePath) {
    currentUser.value.prescriptions.add(imagePath);
  }
}
