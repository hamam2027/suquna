import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suquna/acore/databases/cache/cache_helper.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/constant_text.dart';
import 'package:suquna/model/accontmodels/userdatamodel.dart';
import 'package:suquna/model/myadds_model/my_ads_model.dart';

class AccountScreenController extends GetxController {
  String name = "hamam";

  // var GetStorag = GetStorag();
  ProfileUserData? userData;
  bool isloding = false;
  bool myAdd = false;
  bool myFav = false;
  bool lodfavAndADD = false;
  MyAddsModel? _myAddsModel;
  List<Items>? myadds = [];
  List<Items>? myFavorate = [];
  getUserData() async {
    print("==================================");
    isloding = true;
    update();

    try {
      print(token);
      var response = await http.get(Uri.parse(ApiLinks.getUserData),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        userData = ProfileUserData.fromJson(data);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    isloding = false;
    update();
  }

  Future<http.Response> UserlogOut() async {
    print(token);
    http.Response response = await http.post(Uri.parse(ApiLinks.logoutApi),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      token = null;
      id = null;
      Cashhelper.cleardata(
        key: "token",
      );
      Cashhelper.cleardata(
        key: "id",
      );
      // GetStorag.remove("token");
      // GetStorag.remove("id");
      print(token);
      print(id);

      update();
      return response;
    } else {
      print(token);
      showToust(
          message: response.body,
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.redcolor);
      update();
      return response;
    }
  }

  @override
  void onInit() async {
    print("accont Screen");
    print(token!);
    await getUserData();
    // await getUserFavorate();
    // await getMyaddsAccount();
    super.onInit();
  }

  getMyaddsAccount() async {
    myAdd = true;
    myFav = false;
    lodfavAndADD = true;
    update();
    myFavorate = [];
    update();
    var response = await http.get(Uri.parse(ApiLinks.getMyadds),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _myAddsModel = MyAddsModel.fromJson(data);

      myadds = _myAddsModel!.items!;
      lodfavAndADD = false;
      update();
    } else {
      print("error");
    }
    update();
  }

  getUserFavorate() async {
    myFav = true;
    myAdd = false;
    lodfavAndADD = true;
    update();
    myadds = [];
    update();
    var response = await http.get(Uri.parse(ApiLinks.getuserfavorate),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _myAddsModel = MyAddsModel.fromJson(data);

      myFavorate = _myAddsModel!.items!;
      print(myFavorate!.length);
      lodfavAndADD = false;
      update();
      // showToust(
      //     message: "succes",
      //     textcolor: Colors.white,
      //     backgroundclr: Colors.green);
    } else {
      showToust(
          message: "failed",
          textcolor: Colors.white,
          backgroundclr: Colors.red);
    }
  }

  int ud = -1;
  removeFromFavorate(
    String id,
    int idi,
  ) async {
    lodfavAndADD = true;
    ud = idi;
    update();
    var response = await http.post(
        Uri.parse("${ApiLinks.addGetUpdateProducts}/$id/wishlist"),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      await getUserFavorate();
      update();
      showToust(
          message: "تمت التعديل",
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.successClr);
    } else {
      showToust(
          message: "فشل التعديل",
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.redcolor);
    }

    update();
  }
}
