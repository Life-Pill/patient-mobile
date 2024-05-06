import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/Data/apiLinks.dart';
import 'package:patientmobileapplication/features/Data/medicine_data.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/searching/search_results/ui/search_results_screen.dart';
import 'package:http/http.dart' as http;

class HomeSearchBarController extends GetxController {
  final Profile profileData = Profile();
  TextEditingController textEditingController = TextEditingController();
  RxList<String> filteredSuggestions = <String>[].obs;
  RxString searchedText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(_onTextChanged);
    // Initialize suggestion list with all medicines in alphabetical order
    filteredSuggestions.value = getAllMedicineNames();
  }

  Future<void> uploadImage(File imageFile) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(CustomerPrescriptionsAPI));
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  void openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Assuming Profile is a GetX controller or some globally accessible state
      // profileData.prescriptions.add(pickedFile.path);
      print(pickedFile.path);
      await uploadImage(File(pickedFile.path));
      print("All prescriptions: ${profileData.prescriptions}");
    } else {
      print('No image selected.');
    }
  }

  void clickedSearch(String enteredText) {
    if (enteredText.isEmpty) return;
    Get.to(SearchResults(searchedText: enteredText));
  }

  void _onTextChanged() {
    final text = textEditingController.text.toLowerCase();
    // Filter suggestions based on the typed text (if needed)
    filteredSuggestions.value = text.isEmpty
        ? getAllMedicineNames() // Show all medicines if text is empty
        : _getAutocompleteSuggestions(text);
  }

  List<String> _getAutocompleteSuggestions(String text) {
    print(
        '################################################get autocomplete: $text');
    return medicineData
        .where((medicine) =>
            medicine.name.toLowerCase().startsWith(text.toLowerCase()))
        .map((medicine) => medicine.name)
        .toList();
  }

  List<String> getAllMedicineNames() {
    // Get all medicine names in alphabetical order
    return medicineData.map((medicine) => medicine.name).toList()..sort();
  }
}
class HomeSearchBar extends StatelessWidget {
  final HomeSearchBarController controller = Get.put(HomeSearchBarController());
  final RxBool searchFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBar(
          controller: controller.textEditingController,
          hintText: "Search Medicine...",
          onTap: () {
            searchFocused.value = true;
          },
          onChanged: (text) {
            controller.searchedText.value = text;
            controller._onTextChanged();
          },
          leading: Tooltip(
            message: 'Search',
            child: IconButton(
              onPressed: () {
                controller.clickedSearch(controller.searchedText.value);
              },
              icon: const Icon(Icons.search),
            ),
          ),
          trailing: <Widget>[
            Tooltip(
              message: 'Open Camera',
              child: IconButton(
                onPressed: () {
                  controller.openCamera();
                },
                icon: const Icon(Icons.camera),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        // Adjust spacing if needed
        Obx(() {
          if (searchFocused.value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.filteredSuggestions.map((suggestion) {
                return ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    controller.searchedText.value = suggestion;
                    controller.textEditingController.text = suggestion;
                    controller.filteredSuggestions.clear();
                  },
                );
              }).toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        }),
      ],
    );
  }
}
