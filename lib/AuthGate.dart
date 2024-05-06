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
        CustomSnackBar(
            true, "Successful", "Prescription uploaded successfully");
      }
    } catch (e) {
      print('Error uploading image: $e');
      CustomSnackBar(
          false, "Error occured", "Error uploading the prescription");
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
    print(
        "############################################iText changed to: ${_textEditingController.text}");
    final text = _textEditingController.text.toLowerCase();
    // Filter suggestions based on the typed text (if needed)
    setState(() {
      _filteredSuggestions = text.isEmpty
          ? getAllMedicineNames() // Show all medicines if text is empty
          : _getAutocompleteSuggestions(text);
    });
  }

  List<String> _getAutocompleteSuggestions(String text) {
    print(
        "############################################iAutocomplete text: $text");
    return medicineData
        .where((medicine) =>
            medicine.name.toLowerCase().startsWith(text.toLowerCase()))
        .map((medicine) => medicine.name)
        .toList();
  }

  List<String> getAllMedicineNames() {
    // Get all medicine names in alphabetical order
    print("############################################iAll medicines: ");
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
              print(
                  "###############Inside on Changed function of Search bar text: $text");
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



/*








class HomeSearchBar extends StatelessWidget {
  final HomeSearchBarController controller = Get.put(HomeSearchBarController());
  final RxBool searchFocused = false.obs; // Use RxBool to observe changes

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SearchAnchor(
        builder: (BuildContext context, SearchController searchController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                controller: controller.textEditingController,
                hintText: "Search Medicine...",
                onTap: () {
                  // Update searchFocused when the search bar is tapped
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
                  return SizedBox.shrink(); // Return an empty widget if searchFocused is false
                }
              }),
            ],
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController searchController) {
          // Return an empty list for suggestionsBuilder since suggestions are shown conditionally
          return [];
        },
      ),
    );
  }
}


*/