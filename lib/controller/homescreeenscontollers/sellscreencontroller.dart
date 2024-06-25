import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellScreenController extends GetxController {
  final TextEditingController advcontroller = TextEditingController();
  @override
  void onClose() {
    advcontroller.clear();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  final ImagePicker picker = ImagePicker();
  File? imagefile;
  XFile? image;
  List<XFile> imagesXfile = [];
  List<File> imagesFile = [];
  takephotoFromGalary() async {
    imagesXfile = await picker.pickMultiImage(imageQuality: 80, limit: 10);
    if (imagesXfile.isNotEmpty) {
      imagesXfile.forEach((element) {
        File img = File(element.path);
        if (imagesFile.length < 10) {
          imagesFile.add(img);
        }

        update();
      });

      // imagesFile =imagesFile.addAll(File(image!.path)) ;
    }

    update();
  }
}
