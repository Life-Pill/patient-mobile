import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';

class ProfileEditScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressCityController = TextEditingController();
  TextEditingController addressStreetController = TextEditingController();
  TextEditingController addressDistrictController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  // TextEditingController nicController = TextEditingController();

  ProfileEditScreen() {
    updateControllers();
  }

  void updateControllers() {
    nameController.text = profileController.currentUser.value.name;
    emailController.text = profileController.currentUser.value.email;
    //dobController.text = profileController.currentUser.value.dob;
    addressStreetController.text =
        profileController.currentUser.value.addressStreet;
    addressCityController.text =
        profileController.currentUser.value.addressCity;
    addressDistrictController.text =
        profileController.currentUser.value.addressDistrict;
    phoneNumberController.text =
        profileController.currentUser.value.phoneNumber;
    // nicController.text =
    //     profileController.currentUser.value.nic;
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
              key: const Key('name_field'),
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              key: const Key('email_field'),
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
        
            // TextField(
            //   controller: dobController,
            //   decoration: InputDecoration(labelText: 'Date of Birth'),
            // ),
            // SizedBox(height: 10), // Add some space between fields (optional
            // Text("Gender"),
            // DropdownButton<String>(
            //   value: profileController.currentUser.value.gender,
            //   onChanged: (String? newValue) {
            //     profileController.currentUser.update((val) {
            //       val?.gender = newValue!;
            //     });
            //   },
            //   items: <String>['male', 'female', 'other']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            SizedBox(height: 10),
            Text("Address"),
            TextField(
              key: const Key('address_street_field'),
              controller: addressStreetController,
              decoration: InputDecoration(labelText: 'Street'),
            ),
            TextField(
              key: const Key('address_city_field'),
              controller: addressCityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              key: const Key('address_district_field'),
              controller: addressDistrictController,
              decoration: InputDecoration(labelText: 'District'),
            ),
            TextField(
              key: const Key('phone_number_field'),
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            // TextField(
            //   key: const Key('nic_field'),
            //   controller: nicController,
            //   decoration: InputDecoration(labelText: 'NIC Number'),
            // ),
            ElevatedButton(
              key: const Key('save_button'),
              onPressed: () {
                Get.back();
                profileController.updateProfileAPI(
                  name: nameController.text,
                  email: emailController.text,
                  // dob: dobController.text,
                  // gender: profileController.currentUser.value.gender,
                  addressCity: addressCityController.text,
                  addressStreet: addressStreetController.text,
                  addressDistrict: addressDistrictController.text,
                  phoneNumber: phoneNumberController.text,
                  // nic: nicController.text,
                );
                updateControllers(); // Update text controllers after profile update
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
