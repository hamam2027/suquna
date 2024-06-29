import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:suquna/acore/api/dio_consumer.dart';
import 'package:suquna/acore/errors/expentions.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/model/accontmodels/userdatamodel.dart';

class AccountScreenController extends GetxController {
  String name = "hamam";
  DioConsumer dio = DioConsumer(dio: Dio());
  var getstorage = GetStorage();
  ProfileUserData? userData;
  bool isloding = false;
  getUserData() async {
    isloding = true;
    update();
    try {
      var response = await dio.get(ApiLinks.getUserData,
          headers: {"Authorization": "Bearer $token"}).then((value) {
        userData = ProfileUserData.fromJson(value);
        print(userData!.email);
      });
    } on ServerException catch (e) {
      print(e.toString());
      showToust(
          message: e.errorModel.message!,
          textcolor: AppColors.whiteClr,
          backgroundclr: Colors.red);
    }
    isloding = false;
    update();
  }

  logOut() async {
    var response = await http.post(Uri.parse(ApiLinks.logoutApi), headers: {
      "Authorization": "Bearer $token",
    });
    if (response.statusCode == 200) {
      getstorage.remove("token");
      Get.offNamed(AppRouter.signinscreen);
    } else {
      showToust(
          message: "هناك خطا ما ",
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.redcolor);
    }
  }

  @override
  void onInit() {
    print("accont Screen");
    getUserData();
    super.onInit();
  }
}
