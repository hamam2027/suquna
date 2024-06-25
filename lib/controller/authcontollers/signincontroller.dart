// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suquna/acore/api/dio_consumer.dart';
import 'package:suquna/acore/errors/expentions.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/model/authmodels/usermodel.dart';

class SignInController extends GetxController {
  final DioConsumer dio = DioConsumer(dio: Dio());
  bool isloding = false;

  @override
  void onInit() {
    local = Locale(getstorage.read("lang"));
  }

  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  UserModel? userModel;
  var getstorage = GetStorage();
  Locale? local;

  changlangarco() async {
    if (local == Locale("en_US")) {
      getstorage.write('lang', "ar_EG");
      local = const Locale("ar_EG");
      Get.updateLocale(local!);
    } else {
      null;
    }
  }

  changlangenco() async {
    if (local == Locale("ar_EG")) {
      getstorage.write('lang', "en_US");
      local = const Locale("en_US");
      Get.updateLocale(local!);
    } else {
      null;
    }
  }

  loginWithdio() async {
    isloding = true;
    update();
    try {
      final response = await dio.post(ApiLinks.loginApi, data: {
        "email": emailcontroller.text,
        "password": passwordcontroller.text
      }, headers: {}).then((value) {
        userModel = UserModel.fromJson(value);
        print(userModel!.accessToken);
        Get.offNamed(AppRouter.home);
      });
    } on ServerException catch (e) {
      showToust(
          message: e.errorModel.message!,
          textcolor: AppColors.whiteClr,
          backgroundclr: Colors.red);
    }
    isloding = false;
    update();
  }

  @override
  void onClose() {
    emailcontroller.clear();
    passwordcontroller.clear();
  }
}
