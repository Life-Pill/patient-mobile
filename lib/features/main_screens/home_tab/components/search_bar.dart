import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/Data/apiLinks.dart';
import 'package:patientmobileapplication/features/Data/medicine_data.dart';
import 'package:patientmobileapplication/features/Data/pharmacy_results_data.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/components/custom_snackBar.dart';

import 'package:patientmobileapplication/features/searching/search_results/ui/search_results_screen.dart';
import 'package:http/http.dart' as http;

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final Profile profileData = Profile();
  bool isDark = false;
  late TextEditingController _textEditingController;
  List<String> _filteredSuggestions = [];
  String searchedText = "";
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(_onTextChanged);
    // Initialize suggestion list with all medicines in alphabetical order
    _filteredSuggestions = getAllMedicineNames();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
// Future<void> _uploadImage(File imageFile) async {
//   var request = http.MultipartRequest('POST', Uri.parse(CustomerPrescriptionsAPI));
//   request.files.add(
//     http.MultipartFile(
//       'file',  // Use 'file' as the key
//       imageFile.openRead(),  // Use openRead to get a stream of the file content
//       imageFile.lengthSync(),  // Provide file length
//       filename: imageFile.path.split('/').last,  // Provide filename
//     ),
//   );

//   try {
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//     if (response.statusCode == 200) {
//       print('Image uploaded successfully');
//     } else {
//       print('Failed to upload image ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error uploading image: $e');
//   }
// }
  Future<void> _uploadImage(File imageFile) async {
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
        CustomSnackBar(true, "Successful", "Prescription uploaded successfully");
      }
    } catch (e) {
      print('Error uploading image: $e');
      CustomSnackBar(false, "Error occured", "Error uploading the prescription");
    }
  }

 

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      profileData.prescriptions.add(pickedFile.path);

      print(pickedFile.path);
      await _uploadImage(File(pickedFile.path));
      print("All prescriptions: ${profileData.prescriptions}");
    } else {
      print('No image selected.');
    }
  }

  void _clickedSearch(String enteredText) {
    if (enteredText.isEmpty) return;
    Get.to(SearchResults(
      searchedText: enteredText,
    ));
  }

  void _onTextChanged() {
    final text = _textEditingController.text.toLowerCase();
    // Filter suggestions based on the typed text (if needed)
    setState(() {
      _filteredSuggestions = text.isEmpty
          ? getAllMedicineNames() // Show all medicines if text is empty
          : _getAutocompleteSuggestions(text); // Show filtered suggestions
    });
  }

  List<String> _getAutocompleteSuggestions(String text) {
    return medicineData
        .where((medicine) =>
            medicine.name.toLowerCase().contains(text.toLowerCase()))
        .map((medicine) => medicine.name)
        .toList();
  }

  List<String> getAllMedicineNames() {
    // Get all medicine names in alphabetical order
    return medicineData.map((medicine) => medicine.name).toList()..sort();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(brightness: Brightness.light);

    return Container(
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            hintText: "Search Medicine...",
            onTap: () {
              controller.openView();
            },
            onChanged: (text) {
              // Update suggestions when text changes
              _textEditingController.text = text;
              searchedText = text;
              _onTextChanged();
            },
            leading: Tooltip(
              message: 'Search',
              child: IconButton(
                onPressed: () {
                  _clickedSearch(searchedText);
                },
                icon: const Icon(Icons.search),
              ),
            ),
            trailing: <Widget>[
              Tooltip(
                message: 'Open Camera',
                child: IconButton(
                  onPressed: () {
                    _openCamera();
                  },
                  icon: const Icon(Icons.camera),
                ),
              ),
            ],
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          return _filteredSuggestions.map((suggestion) {
            return ListTile(
              title: Text(suggestion),
              onTap: () {
                setState(() {
                  controller.closeView(suggestion);
                  searchedText = suggestion;
                  print(" Suggested text: $searchedText");
                });
              },
            );
          }).toList();
        },
      ),
    );
  }
}
