import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreenController extends GetxController {
  String? imagePath;

  Uint8List? image;

  final ImagePicker _imagePicker = ImagePicker();

  Future<String?> pickImageFromCamera() async {
    try {

      // Display Loading Dialog
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.white70,
        name: "Loading Dialog",
      );

      XFile? file = await _imagePicker.pickImage(
        source: ImageSource.camera,
      );

      if (file != null) {

        image =  await file.readAsBytes();

        imagePath = file.path;

        return imagePath;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;

    }finally {
      // Close the loading dialog
      Get.back();
    }
  }
}
