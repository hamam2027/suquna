import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/model/homemodels/home_category_model.dart';

class HomeScreenController extends GetxController {
  RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    print("HomeScreen");
    getAllcategory();
    super.onInit();
  }

  HomeCatModel? homeCatModel;
  List<HomeCatModel> categoryList = [];

  Future getAllcategory() async {
    var response = await http.get(
      Uri.parse(ApiLinks.homeApi),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      categoryList = [];
      update();
      List<dynamic> data = jsonDecode(response.body);
      data.forEach((element) {
        homeCatModel = HomeCatModel.fromJson(element);

        categoryList.add(homeCatModel!);

        print(categoryList.length);
      });
      update();
      return response;
    }

    update();
    return response;
  }
}
