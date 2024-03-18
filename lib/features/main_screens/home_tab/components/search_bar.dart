import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/Data/medicine_data.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool isDark = false;
  late TextEditingController _textEditingController;
  List<String> _filteredSuggestions = [];

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
        .where((medicine) => medicine.name.toLowerCase().contains(text.toLowerCase()))
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
              _onTextChanged();
            },
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Open Camera',
                child: IconButton(
                  onPressed: () {
                    _openCamera(context);
                  },
                  icon: const Icon(Icons.camera),
                ),
              )
            ],
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) {
          return _filteredSuggestions.map((suggestion) {
            return ListTile(
              title: Text(suggestion),
              onTap: () {
                setState(() {
                  controller.closeView(suggestion);
                });
              },
            );
          }).toList();
        },
      ),
    );
  }
}
