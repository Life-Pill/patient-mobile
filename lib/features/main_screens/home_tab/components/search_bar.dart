import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/Data/apiLinks.dart';
import 'package:patientmobileapplication/features/Data/medicine_data.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/searching/search_results/ui/search_results_screen.dart';
import 'package:http/http.dart' as http;

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final Profile profileData = Profile();

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

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0, // Add elevation for shadow
      borderRadius: BorderRadius.circular(30.0),
      child: GestureDetector(
        onTap: () {
          // Open suggestions when tapped
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
        child: Container(
          margin: EdgeInsets.all(2.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  // Open suggestions when search icon is clicked
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: Icon(Icons.search),
                color: Colors.black,
              ),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search', // Add hint text
                    border: InputBorder.none,
                  ),
                  readOnly:
                      true, // Make the field read-only to prevent keyboard from popping up
                  onTap: () {
                    // Open suggestions when tapped
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  openCamera();
                },
                icon: Icon(Icons.camera),
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms =
      medicineData.map((medicine) => medicine.name).toList()..sort();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, result);
            // Navigate to search results page with the selected result
            Get.to(SearchResults(searchedText: result));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, result);
            // Navigate to search results page with the selected result
            Get.to(SearchResults(searchedText: result));
          },
        );
      },
    );
  }
}
