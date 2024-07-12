import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';

class DataCollectScreen extends StatefulWidget {

  final String email;

  DataCollectScreen({required this.email});

  @override
  State<DataCollectScreen> createState() => _DataCollectScreenState();
}

class _DataCollectScreenState extends State<DataCollectScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  TextEditingController addressCityController = TextEditingController();

  TextEditingController addressStreetController = TextEditingController();

  TextEditingController addressDistrictController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  bool nameBoxFieldChanged = false;
  bool streetFieldChanged = false;
  bool cityFieldChanged = false;
  bool districtFieldChanged = false;
  bool phoneFieldChanged = false;


  @override
  void initState() {
    super.initState();
    emailController.text = widget.email;
    updateControllers();
  }

  void updateControllers() {
    nameController.text = profileController.currentUser.value.name;
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
  bool _isNextButtonEnabled() {
    return nameBoxFieldChanged ||
        streetFieldChanged ||
        cityFieldChanged ||
        districtFieldChanged ||
        phoneFieldChanged;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to LifePill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "In order to ensure we provide the best possible service, we kindly request some additional information."
            ),

            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Color(0xFFF1F4FF),
                labelText: 'Name',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Name can't be empty";
                }
                if (text.length > 99) {
                  return "Name cannot be more than 100";
                }
              },
              onChanged: (text) => setState(() {
                nameController.text = text;
                nameBoxFieldChanged = true;
              }),
            ),

            const SizedBox(height: 16),

            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Color(0xFFF1F4FF),
                labelText: 'Street',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Street can't be empty";
                }
                if (text.length > 99) {
                  return "Street cannot be more than 100";
                }
              },
              onChanged: (text) => setState(() {
                addressStreetController.text = text;
                streetFieldChanged = true;
              }),
            ),

            const SizedBox(height: 16),

            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Color(0xFFF1F4FF),
                labelText: 'City',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "City can't be empty";
                }
                if (text.length > 99) {
                  return "City cannot be more than 100";
                }
              },
              onChanged: (text) => setState(() {
                addressCityController.text = text;
                cityFieldChanged = true;
              }),
            ),

            const SizedBox(height: 16),

            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Color(0xFFF1F4FF),
                labelText: 'District',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "District can't be empty";
                }
                if (text.length > 99) {
                  return "District cannot be more than 100";
                }
              },
              onChanged: (text) => setState(() {
                addressDistrictController.text = text;
                districtFieldChanged = true;
              }),
            ),

            const SizedBox(height: 16),

            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Color(0xFFF1F4FF),
                labelText: 'Phone number',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Phone number can't be empty";
                }
                if (text.length > 10) {
                  return "Phone number cannot be more than 10 digits";
                }
              },
              onChanged: (text) => setState(() {
                phoneNumberController.text = text;
                phoneFieldChanged = true;
              }),
            ),

            const SizedBox(height: 16),




            ElevatedButton(
              key: const Key('next_button'),
              onPressed: _isNextButtonEnabled()
                  ? () {
                Get.to(() => HomeScreen());
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
                updateControllers();
              }
                  : null,

              child: Text('Save and Enter LifePill'),
            ),
          ],
        ),
      ),
    );
  }
}
