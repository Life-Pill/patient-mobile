// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patientmobileapplication/features/Data/apiLinks.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/reports_pdf_list.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/reports_photo_list.dart';
import 'package:patientmobileapplication/features/main_screens/components/top_navbar.dart';


import 'package:http/http.dart' as http;

class CameraTabScreen extends StatefulWidget {
  const CameraTabScreen({Key? key}) : super(key: key);

  @override
  State<CameraTabScreen> createState() => _CameraTabScreenState();
}

class _CameraTabScreenState extends State<CameraTabScreen> {
  final Profile profileData = Profile();

  late Box<List<dynamic>> reportsImageBox;
    late Box<List<dynamic>> reportsPdfBox;

  @override
  void initState() {
    super.initState();
    _openReportImageBox();
        _openReportPdfBox();
  }



Future<void> _saveImageInHive(File imageFile) async {
  try {
    List<int> bytes = await imageFile.readAsBytes();
    

    String dateTime =DateTime.timestamp().toString();

    // Save the image data along with the date and time
    final data = [dateTime, bytes];

    // Save the data in the reportsImageBox
    await reportsImageBox.add(data);
    print('Image saved in Hive');
  } catch (e) {
    print('Error saving image in Hive: $e');
  }
}

  Future<void> _openReportImageBox() async {
    reportsImageBox = Hive.box('reportsImageBox');
  }

    Future<void> _openReportPdfBox() async {
    reportsPdfBox = Hive.box('reportsPdfBox');
  }




Future<void> _saveFileInHive(File file) async {
  try {

    final filename = file.path.split('/').last;
    final bytes = await file.readAsBytes();
    String dateTime =DateTime.timestamp().toString();

    if (_isPdf(filename)) {
      final data = [filename,dateTime, bytes];
       await reportsPdfBox.add(data);
    print('PDF file saved in reportPdfBox');
     
    } else {
      // If not a PDF, save it in the existing reportsImageBox
      _saveImageInHive(file);
    }

    // Save the list in the reportsPdfBox
   
  } catch (e) {
    print('Error saving file in Hive: $e');
  }
}



bool _isPdf(String filename) {
  // Check if the filename has a .pdf extension
  return filename.toLowerCase().endsWith('.pdf');
}
  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        profileData.reports.add(pickedFile.path);
      });
      print(pickedFile.path);
      print("All reports: ${profileData.reports}");
    //  await _uploadImage(File(pickedFile.path));
      await _saveImageInHive(File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  void _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileData.reports.add(pickedFile.path);
      });
      print(pickedFile.path);
      print("All reports: ${profileData.reports}");
    //  await _uploadImage(File(pickedFile.path));
      await _saveImageInHive(File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  void _openFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'pdf'
      ], // Specify allowed file extensions
    );

    if (result != null) {
      File file = File(result.files.single.path!); // Get the selected file
      setState(() {
        profileData.reports.add(file.path);
      });
      print(file.path);
      print("All reports: ${profileData.reports}");
      //await _uploadFile(file);
      await _saveFileInHive(file);
    } else {
      print('No file selected.');
    }
  }

  Future<void> _uploadFile(File file) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(CustomerPrescriptionsAPI));
    request.files.add(
      http.MultipartFile(
        'file', // Use 'file' as the key
        file.openRead(), // Use openRead to get a stream of the file content
        file.lengthSync(), // Provide file length
        filename: file.path.split('/').last, // Provide filename
      ),
    );

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Failed to upload file ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

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
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
  Future<void> _resetHiveBoxes() async {
    // Close existing boxes if they are open
    if (reportsImageBox.isOpen) await reportsImageBox.close();
    if (reportsPdfBox.isOpen) await reportsPdfBox.close();

    // Delete existing Hive database files from disk
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final hiveDirectory = Directory(appDocumentDir.path);
    hiveDirectory.deleteSync(recursive: true);

    // Open new Hive boxes
    reportsImageBox = await Hive.openBox<List<dynamic>>('reportsImageBox');
     reportsPdfBox = await Hive.openBox<List<dynamic>>('reportsPdfBox');
    print('Hive boxes reset');
  }
  Profile current_user = new Profile();

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
                    TabName: "Your Reports",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Add a new report by taking a picture or selecting from your gallery",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: _openCamera,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt), // Icon added here
                                  SizedBox(
                                      width: 10), // Space between icon and text
                                  Text("Open\nCamera"),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _openGallery,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons
                                      .photo_size_select_actual_rounded), // Icon added here
                                  SizedBox(
                                      width: 10), // Space between icon and text
                                  Text("Open\nGallery"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: _openFiles,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt), // Icon added here
                              SizedBox(
                                  width: 10), // Space between icon and text
                              Text("Open\nFiles"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: _resetHiveBoxes,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Space between icon and text
                              Text("Reset Hive Boxes"),
                            ],
                          ),
                        ),
                        ReportPhotosList(reports: profileData.reports),
                        SizedBox(height: 10.0,),
                        ReportsPdfList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
