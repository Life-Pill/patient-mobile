import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class PhotoOpenScreen extends StatelessWidget {
  final Image openedImage;
  const PhotoOpenScreen({super.key, required this.openedImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.shareXFiles([XFile()]);
            },
          ),
        ],
      ),
      body: PhotoView(
        imageProvider: openedImage.image,
        backgroundDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
