import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/constant_text.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';
import 'package:suquna/model/homemodels/home_category_model.dart';

class EditProfileScreenController extends GetxController {
  AccountScreenController controller = Get.find();
  String? editCountry;
  String? gender;
  bool isloode = false;

  changgender(String? value) {
    gender = value;
    update();
  }

  changCountry(String? value) {
    editCountry = value!;
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
  GlobalKey<FormState> editProfileKey = GlobalKey();

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
    var response = await http.get(Uri.parse(ApiLinks.getUserData),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      user = User.fromJson(data);
      editCountry = user!.address!;
      gender = user!.gender.toString();
      editphonecontroller.text = user!.phone!;
      editNamecontroller.text = user!.name!;
      editdatecontroller.text = user!.dob!;
      update();
      print(user!.name!);
    }
  }

  changeDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1940),
      lastDate: DateTime(2010),
    );
    if (selectedDate != null) {
      editdatecontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
      update();
    }
  }

  editProfileDetailse() async {
    isloode = true;
    update();

    var uri = Uri.parse(ApiLinks.getUserData);
    var request = http.MultipartRequest('POST', uri);

    // إضافة الحقول النصية
    request.fields['name'] = editNamecontroller.text;
    request.fields['phone'] = editphonecontroller.text;
    request.fields['address'] = editCountry ?? '';
    request.fields['gender'] = gender ?? '';
    request.fields['dob'] = editdatecontroller.text;

    // إضافة ملف الصورة إذا كان موجودًا
    if (imagefile != null) {
      request.files
          .add(await http.MultipartFile.fromPath('avatar', imagefile!.path));
    }

    // إضافة الهيدر
    request.headers.addAll({"Authorization": "Bearer $token"});

    // إرسال الطلب
    var response = await request.send();

    if (response.statusCode == 200) {
      showToust(
          message: "تم التعديل بنجاح",
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.successClr);
      var responseBody = await http.Response.fromStream(response);
      print(responseBody.body);
      getuserDetailse();
      isloode = false;

      update();
      controller.getUserData();
    } else {
      var responseBody = await http.Response.fromStream(response);
      print(responseBody.body);
      Map<String, dynamic> jsonObject = {
        "error": {
          "phone": ["The phone has already been taken."]
        }
        // jsonObject["eroor"]["phone"][0]
      };
      showToust(
          message: jsonObject["error"]["phone"][0],
          textcolor: AppColors.blackClr,
          backgroundclr: AppColors.successClr);

      isloode = false;
      update();
    }
    isloode = false;
    update();
  }

  @override
  void onInit() {
    getuserDetailse();
    super.onInit();
  }
}

Future<String> convertFileToBase64(String filePath) async {
  File file = File(filePath);
  List<int> fileBytes = await file.readAsBytes();
  String base64File = base64Encode(fileBytes);
  return base64File;
}
