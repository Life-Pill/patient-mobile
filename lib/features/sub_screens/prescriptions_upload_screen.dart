import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as diodart;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patientmobileapplication/features/Data/apiLinks.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';

import 'package:http/http.dart' as http;

import 'package:patientmobileapplication/features/main_screens/main_home/ui/main_home_screen.dart';
import 'package:patientmobileapplication/features/sub_screens/prescriptions_photo_list.dart';

class PrescriptionsUploadScreen extends StatefulWidget {
  const PrescriptionsUploadScreen({super.key});

  @override
  State<PrescriptionsUploadScreen> createState() =>
      _PrescriptionsUploadScreenState();
}

class _PrescriptionsUploadScreenState extends State<PrescriptionsUploadScreen> {
  late Box<List<dynamic>> prescriptionsImageBox;
  final Profile profileData = Profile();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _openPrescriptionImageBox();
  }

  Future<File> _convertImageToPng(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    img.Image? image = img.decodeImage(bytes);

    if (image != null) {
      final pngBytes = img.encodePng(image);
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
      final pngFile = File(filePath);
      await pngFile.writeAsBytes(pngBytes);
      return pngFile;
    } else {
      throw 'Failed to decode image';
    }
  }

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final pngFile = await _convertImageToPng(File(pickedFile.path));
      await _promptMessageAndUpload(pngFile);
    } else {
      print('No image selected.');
    }
  }

  void _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final pngFile = await _convertImageToPng(File(pickedFile.path));
      await _promptMessageAndUpload(pngFile);
    } else {
      print('No image selected.');
    }
  }

  Future<void> _promptMessageAndUpload(File imageFile) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Message'),
          content: TextField(
            controller: _messageController,
            decoration: InputDecoration(hintText: "Enter any message if needed"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Upload'),
              onPressed: () async {
                Navigator.of(context).pop();
                setState(() {
                  profileData.prescriptions.add({
                    'path': imageFile.path,
                    'message': _messageController.text
                  });
                });
                await _uploadImage(imageFile, _messageController.text);
                await _saveImageInHive(imageFile, _messageController.text);
                _messageController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _uploadImage(File imageFile, String message) async {
    try {
      diodart.Dio dio = diodart.Dio();

      diodart.FormData formData = diodart.FormData.fromMap({
        'file': await diodart.MultipartFile.fromFile(
          imageFile.path,
          filename: 'image.png',
          contentType: MediaType('image', 'png'),
        ),
        'message': message,
      });

      diodart.Response response = await dio.post(
        CustomerPrescriptionsAPI,
        data: formData,
      );

      if (response.statusCode == 200) {
        print('Prescription uploaded successfully: ${response.data}');
        await _sendOrderDetails(ConstCustomerID, response.data, message);
      } else {
        print('Error uploading Prescription: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading Prescription: $error');
    }
  }

  Future<void> _sendOrderDetails(int customerId, String prescriptionId, String customerMessage) async {
    try {
      Map<String, dynamic> requestBody = {
        'customerId': customerId,
        'prescriptionId': prescriptionId,
        'customerMessage': customerMessage,
      };

      final response = await http.post(
        Uri.parse(PrescriptionOrderPostAPI),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Order details sent successfully');
      } else {
        print('Error sending order details: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending order details: $error');
    }
  }

  Future<void> _saveImageInHive(File imageFile, String message) async {
    try {
      List<int> bytes = await imageFile.readAsBytes();
      String dateTime = DateTime.now().toString();
      final data = [dateTime, bytes, message];

      await prescriptionsImageBox.add(data);
      print('Prescription saved in Hive');
    } catch (e) {
      print('Error saving Prescription in Hive: $e');
    }
  }

  Future<void> _openPrescriptionImageBox() async {
    prescriptionsImageBox = Hive.box('prescriptionsImageBox');
  }

  Future<void> _resetHiveBoxes() async {
    if (prescriptionsImageBox.isOpen) await prescriptionsImageBox.close();

    final appDocumentDir = await getApplicationDocumentsDirectory();
    final hiveDirectory = Directory(appDocumentDir.path);
    hiveDirectory.deleteSync(recursive: true);

    prescriptionsImageBox = await Hive.openBox<List<dynamic>>('prescriptionsImageBox');

    print('Hive boxes reset');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 60.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopNavBar(
                    NeedSearchBar: false,
                    TabName: "Search for a Medicine",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          "Send us your prescription to us by taking a photo or uploading it from your gallery",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: _openCamera,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt),
                                  SizedBox(width: 10),
                                  Text("Open\nCamera"),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _openGallery,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.photo_size_select_actual_rounded),
                                  SizedBox(width: 10),
                                  Text("Open\nGallery"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        PrescriptionPhotosList(
                          prescriptions: profileData.prescriptions,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size(220, 50),
              backgroundColor: Colors.greenAccent.shade200,
            ),
            onPressed: () {
              Get.to(() => HomeScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Go Back to Home Page"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


