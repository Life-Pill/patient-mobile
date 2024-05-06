import 'package:flutter/material.dart';
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
  TextEditingController nicController = TextEditingController();

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
            // TextField(
            //   controller: dobController,
            //   decoration: InputDecoration(labelText: 'Date of Birth'),
            // ),
            SizedBox(height: 10), // Add some space between fields (optional
            Text("Gender"),
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
            SizedBox(height: 10), // Add some space between fields (optional
            Text("Address"),
            TextField(
              controller: addressStreetController,
              decoration: InputDecoration(labelText: 'Street'),
            ),
            TextField(
              controller: addressCityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: addressDistrictController,
              decoration: InputDecoration(labelText: 'District'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
               TextField(
              controller: nicController,
              decoration: InputDecoration(labelText: 'NIC Number'),
            ),
            ElevatedButton(
              onPressed: () {
                   Get.back();
                profileController.updateProfileAPI(
                  name: nameController.text,
                  email: emailController.text,
                  //    dob: dobController.text,
                  //    gender: profileController.currentUser.value.gender,
                  addressCity: addressCityController.text,
                  addressStreet: addressStreetController.text,
                  addressDistrict: addressDistrictController.text,
                  phoneNumber: phoneNumberController.text,
 
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
