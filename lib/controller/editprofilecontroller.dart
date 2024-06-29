import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';
import 'package:suquna/model/homemodels/home_category_model.dart';

class EditProfileScreenController extends GetxController {
  AccountScreenController controller = Get.find();
  String? editCountry;
  String? gender;
  changgender(String? value) {
    gender = value;
    update();
  }

  changCountry(String? value) {
    editCountry = value;
    update();
  }

  List<XFile> images = [];
  final ImagePicker picker = ImagePicker();
  File? imagefile;
  XFile? image;

  TextEditingController editAdresscontroller = TextEditingController();
  TextEditingController editGendercontroller = TextEditingController();
  TextEditingController editphonecontroller = TextEditingController();
  TextEditingController editNamecontroller = TextEditingController();
  TextEditingController editdatecontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

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

  User? user;
  getuserDetailse() async {
    var response =
        await http.get(Uri.parse(ApiLinks.getUserData), headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      user = User.fromJson(data);
      update();
      print(user!.name!);
    }
  }

  editProfileDetailse() async {
    try {
      var response = await http
          .post(Uri.parse(ApiLinks.getUserData), headers: header, body: {
        "name": "hamam gaber",
        // "phone": "01298563495",
        "address": "torky",
        "gender": "1",
        "dob": "1990-06-11"
      });
      if (response.statusCode == 200) {
        print(response.body);
        controller.getUserData();
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    getuserDetailse();
    super.onInit();
  }
}
