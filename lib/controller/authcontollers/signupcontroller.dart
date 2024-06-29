import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:suquna/acore/api/api_consumer.dart';
import 'package:suquna/acore/api/dio_consumer.dart';
import 'package:suquna/constant/applinks.dart';

class SignUpController extends GetxController {
  String? cuntry;
  List<XFile> images = [];
  final ImagePicker picker = ImagePicker();
  File? imagefile;
  XFile? image;
  List<XFile>? imagess;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conpasswordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();
  FocusNode usernamefocus = FocusNode();
  FocusNode conpasswordfocus = FocusNode();
  FocusNode phonfocus = FocusNode();
  ApiConsumer dio = DioConsumer(dio: Dio());
  signUpUser() async {
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiLinks.registrationApi));
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
    request.files
        .add(await http.MultipartFile.fromPath('avatar', "${image!.path}"));

    var response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
//hamama@flutter.com
  // ASDwer@#125

  // hamed@gmail.com
  // As@#$1236589

  //   try {
  //     var response =
  //         await http.post(Uri.parse(ApiLinks.registrationApi), body: {

  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  takephotoFromGalary() async {
    imagess = await picker.pickMultipleMedia(imageQuality: 80, limit: 10);
    if (image != null) {
      imagefile = File(image!.path);
    }

    update();
  }

  takephotoFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagefile = File(image!.path);
      print(imagefile!.readAsBytes());
    }
    update();
  }
}




//  var response = await dio.post(ApiLinks.registrationApi, data: {
//         "name": usernamecontroller.text,
//         "phone": phonecontroller.text,
//         "password": passwordcontroller.text,
//         "password_confirmation": conpasswordcontroller.text,
//         "email": emailcontroller.text,
//         "gender": "1",
//         "dob": "1990-06-12",
//         "address": "egypt",
//         "avatar": imagefile!
//       }).then((value) {
//         return value;
//       });
//     } on ServerException catch (e) {
//       // print(e.toString());
//       showToust(
//           message: e.errorModel.message!,
//           textcolor: AppColors.whiteClr,
//           backgroundclr: Colors.red);
//     }
