import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ReportPhotosList extends StatefulWidget {
  final List<String> reports;

  ReportPhotosList({required this.reports});

  @override
  _ReportPhotosListState createState() => _ReportPhotosListState();
}

class _ReportPhotosListState extends State<ReportPhotosList> {
  late Box<List<int>> imageBox;
  List<Image> imageList = [];

  @override
  void initState() {
    super.initState();
    _openImageBox();
  }

  Future<void> _openImageBox() async {
    imageBox = await Hive.openBox<List<int>>('prescriptionsBox');
    _loadImages();
    imageBox.watch().listen((event) {
      _loadImages();
    });
  }

  Future<void> _loadImages() async {
    final List<List<int>> imageDataList = imageBox.values.toList();
    final List<Image> images = [];
    for (final imageData in imageDataList) {
      final image = Image.memory(
        Uint8List.fromList(imageData),
        fit: BoxFit.fitWidth,
      );
      images.add(image);
    }
    setState(() {
      imageList = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: imageList.map((image) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: image,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
