import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';

class SignUpController extends GetxController {
  String? cuntry;
  List<XFile> images = [];
  final ImagePicker picker = ImagePicker();
  File? imagefile;
  XFile? image;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conpasswordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey();
  bool isload = false;
  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();
  FocusNode usernamefocus = FocusNode();
  FocusNode conpasswordfocus = FocusNode();
  FocusNode phonfocus = FocusNode();

  signUpUser() async {
    isload = true;
    update();

    var uri = Uri.parse(ApiLinks.registrationApi);
    var request = http.MultipartRequest('POST', uri);

    // Add text fields
    request.fields.addAll({
      "name": usernamecontroller.text,
      "phone": phonecontroller.text,
      "password": passwordcontroller.text,
      "password_confirmation": conpasswordcontroller.text,
      "email": emailcontroller.text,
      "gender": "1",
      "dob": datecontroller.text,
      "address": cuntry!,
    });

    // Add image file if exists
    if (imagefile != null) {
      request.files
          .add(await http.MultipartFile.fromPath('avatar', imagefile!.path));
    }

    // Send request
    var response = await request.send();

    if (response.statusCode == 200) {
      showToust(
          message: "تم انشاء الحساب بنجاح",
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.successClr);
      Get.offAllNamed(AppRouter.signinscreen);
      var responseBody = await http.Response.fromStream(response);
      print(responseBody.body);

      isload = false;
      update();
    } else {
      var responseBody = await http.Response.fromStream(response);
      print(responseBody.body);
      showToust(
          message: responseBody.body,
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.successClr);

      isload = false;
      update();
    }
    isload = false;
    update();
  }

  takephotoFromGalary() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagefile = File(image!.path);
    }

    update();
  }

  takephotoFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagefile = File(image!.path);
    }
    update();
  }

  @override
  void onClose() {
    clearDataForm();
    super.onClose();
  }

  clearDataForm() {
    emailcontroller.clear();
    passwordcontroller.clear();
    conpasswordcontroller.clear();
    phonecontroller.clear();
    usernamecontroller.clear();
    datecontroller.clear();
  }
}

// AZXCas!@#325
// maher@h.com
// hamama@flutter.com
//   ASDwer@#125

  // hamed@gmail.com
  // As@#$1236589