import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Profile {
  String name = "default";
  String email = "";
  String img = "assets/images/defaultProfilePic.png";
  String dob = "";
  String gender = "male";
  String address = "";
  String phoneNumber = "";
  List<String> reports = [];
  List<String> prescriptions = [];
}

class ProfileController extends GetxController {
  var currentUser = Profile().obs;

  void updateProfile({
    required String name,
    required String email,
    required String dob,
    required String gender,
    required String address,
    required String phoneNumber,
  }) {
    currentUser.update((val) {
      val?.name = name;
      val?.email = email;
      val?.dob = dob;
      val?.gender = gender;
      val?.address = address;
      val?.phoneNumber = phoneNumber;
    });
  }

  Future<void> fetchProfileData() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.50.227:8080/customers/1'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        updateProfile(
          name: jsonData['customerFullName'],
          email: jsonData['customerEmail'],
          dob: '', // Fill with appropriate value if available in your API
          gender: 'male', // Fill with appropriate value if available in your API
          address: jsonData['customerAddressStreet'] +
              ', ' +
              jsonData['customerAddressCity'] +
              ', ' +
              jsonData['customerAddressDistrict'],
          phoneNumber: jsonData['customerMobileNumber'],
        );
          print('Name: ${currentUser.value.name}');
        print('Email: ${currentUser.value.email}');
        print('Date of Birth: ${currentUser.value.dob}');
        print('Gender: ${currentUser.value.gender}');
        print('Address: ${currentUser.value.address}');
        print('Phone Number: ${currentUser.value.phoneNumber}');
      } else {
        throw Exception('Failed to load profile data');
      }
    } catch (error) {
      throw Exception('Failed to load profile data: $error');
    }
  }
}
