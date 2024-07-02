import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suquna/acore/databases/cache/cache_helper.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/constant_text.dart';
import 'package:suquna/model/authmodels/usermodel.dart';

class SignInController extends GetxController {
  bool isloding = false;

  @override
  void onInit() async {
    print(token);
    local = Locale(await Cashhelper.grtdata(key: "lang"));

    update();
  }

  GlobalKey<FormState> signInKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  UserModel? userModel;
  // var GetStorag = GetStorag();
  Locale? local;

  changlangarco() async {
    if (local == Locale("en_US")) {
      Cashhelper.saveData(key: "lang", value: "ar_EG");
      // GetStorag.write('lang', "ar_EG");
      local = const Locale("ar_EG");
      Get.updateLocale(local!);
    } else {
      null;
    }
  }

  changlangenco() async {
    if (local == Locale("ar_EG")) {
      Cashhelper.saveData(key: "lang", value: "en_US");
      // GetStorag.write('lang', "en_US");
      local = const Locale("en_US");
      Get.updateLocale(local!);
    } else {
      null;
    }
  }

  Future loginWithHttp() async {
    isloding = true;
    update();
    var response;

    response = await http.post(
      Uri.parse(ApiLinks.loginApi),
      body: {
        "email": emailcontroller.text,
        "password": passwordcontroller.text,
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      userModel = UserModel.fromJson(data);
      print(userModel!.accessToken);

      token = userModel!.accessToken;
      await Cashhelper.saveData(key: "token", value: token);

      id = userModel!.user!.id;

      await Cashhelper.saveData(key: "id", value: id);

      showToust(
        message: "Success",
        textcolor: AppColors.whiteClr,
        backgroundclr: AppColors.successClr,
      );

      isloding = false;
      update();
      Get.offAllNamed(AppRouter.home);

      return response;
    } else {
      showToust(
        message: response.body.toString(),
        textcolor: AppColors.whiteClr,
        backgroundclr: Colors.red,
      );
      isloding = false;
      update();
      return response;
    }
  }

  @override
  void onClose() {
    emailcontroller.clear();
    passwordcontroller.clear();
    super.onClose();
  }
}
// AZXCas!@#325
// maher@h.com
// hamama@flutter.com
//   ASDwer@#125

// hamed@gmail.com
// As@#$1236589
// ASD123@#$
// 89|NsLzV3Qv4Hypxl91ZJfB8J1RmH8DStuIGiutmsDQe5a3f87a


