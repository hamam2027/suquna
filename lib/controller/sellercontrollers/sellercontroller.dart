import 'dart:convert';

import 'package:get/get.dart';
import 'package:suquna/model/authmodels/usermodel.dart';

class Sellercontroller extends GetxController {
  User? userModel;
  @override
  void onInit() async {
    Map<String, dynamic> data = jsonDecode(await Get.arguments["seller"]);
    userModel = User.fromJson(data);
    update();
    super.onInit();
  }
}
