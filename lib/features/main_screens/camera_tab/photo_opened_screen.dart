import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class PhotoOpenScreen extends StatelessWidget {
  final Uint8List imageBytes;

  const PhotoOpenScreen({super.key, required this.imageBytes});

  Future<void> _shareImage() async {
    try {
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/shared_image.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(imageBytes);

      await Share.shareXFiles([XFile(imagePath)]);
    } catch (e) {
      print('Error sharing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Images"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _shareImage,
          ),
        ],
      ),
      body: PhotoView(
        imageProvider: MemoryImage(imageBytes),
        backgroundDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
