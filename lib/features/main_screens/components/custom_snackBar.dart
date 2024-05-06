import 'package:flutter/material.dart';
import 'package:get/get.dart';

CustomSnackBar(bool isok, String title,String message) {
isok? Get.snackbar(title, message, backgroundColor: Colors.green.shade200):
Get.snackbar(title, message, backgroundColor: Colors.red.shade200);
}