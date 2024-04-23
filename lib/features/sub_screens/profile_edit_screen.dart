import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';


class ProfileEditScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  ProfileEditScreen() {
    updateControllers();
  }

  void updateControllers() {
    nameController.text = profileController.currentUser.value.name;
    emailController.text = profileController.currentUser.value.email;
    dobController.text = profileController.currentUser.value.dob;
    addressController.text = profileController.currentUser.value.address;
    phoneNumberController.text = profileController.currentUser.value.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            DropdownButton<String>(
              value: profileController.currentUser.value.gender,
              onChanged: (String? newValue) {
                profileController.currentUser.update((val) {
                  val?.gender = newValue!;
                });
              },
              items: <String>['male', 'female', 'other']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            ElevatedButton(
              onPressed: () {
                profileController.updateProfile(
                  name: nameController.text,
                  email: emailController.text,
                  dob: dobController.text,
                  gender: profileController.currentUser.value.gender,
                  address: addressController.text,
                  phoneNumber: phoneNumberController.text,
                );
                updateControllers(); // Update text controllers after profile update
                Get.back();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
