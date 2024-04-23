import 'package:get/get.dart';

class Profile {
  String name = "John Red";
  String email = "john@gmail.com";
  String img = "assets/images/defaultProfilePic.png";
  String dob = "11/02/2020";
  String gender = "male";
  String address = "No 2, ABC road, ABC";
  String phoneNumber = "07171717171";
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
}


