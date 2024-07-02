import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suquna/acore/databases/cache/cache_helper.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/constant_text.dart';
import 'package:suquna/model/homemodels/home_category_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreenController extends GetxController {
  RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    getAllcategory();
    super.onInit();
  }

  bool loding = false;

  HomeCatModel? homeCatModel;
  List<HomeCatModel> categoryList = [];

  Future getAllcategory() async {
    var response = await http.get(
      Uri.parse(ApiLinks.homeApi),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      print(token);
      categoryList = [];
      update();
      List<dynamic> data = jsonDecode(response.body);
      data.forEach((element) {
        homeCatModel = HomeCatModel.fromJson(element);

        categoryList.add(homeCatModel!);
      });
      print(categoryList.length);
      update();
      return response;
    }

    update();
    return response;
  }

  int? uim;

  addToFavorate(String id, int uid) async {
    uim = uid;
    loding = true;
    update();
    var response = await http.post(
        Uri.parse("${ApiLinks.addGetUpdateProducts}/$id/wishlist"),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      await getAllcategory();
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
    loding = false;
    update();
  }

  void checkUserStatus() async {
    token = await Cashhelper.grtdata(key: "token");
    id = await Cashhelper.grtdata(key: "id");

    print("Checking user status...");
    if (token == null || id == null) {
      print("id and token is not found");
    } else {
      print("User is logged in with token: $token and ID: $id");
    }
  }
}
