import 'package:flutter/material.dart';

/// Flutter code sample for [SearchBar].

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool isDark = false;

  void _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Do something with the picked image
      print(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(brightness: Brightness.light);

    return Container(
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            Tooltip(
              message: 'Change brightness mode',
              child: IconButton(
                onPressed: () {
                  _openCamera(context);
                  setState(() {
                    isDark = !isDark;
                  });
                },
                icon: const Icon(Icons.camera),
              ),
            )
          ],
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
