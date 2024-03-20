import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/Data/medicine_data.dart';
import 'package:patientmobileapplication/features/Data/pharmacy_results_data.dart';
import 'package:patientmobileapplication/features/searching/search_results/ui/search_results_screen.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
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

  void _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Do something with the picked image
      print(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
  void _clickedSearch(String enteredText) {
    Get.to(SearchResults(searchedText: enteredText.toLowerCase(),));
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
                  print("00000000000000000000  Suggested text at the tooltip: $searchedText");
                  _clickedSearch(searchedText);              },
                icon: const Icon(Icons.search),
              ),
            ),
            trailing: <Widget>[
              Tooltip(
                message: 'Open Camera',
                child: IconButton(
                  onPressed: () {
                    _openCamera(context);
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
                  print("00000000000000000000  Suggested text: $searchedText");
                });
              },
            );
          }).toList();
        },
      ),
    );
  }
}
