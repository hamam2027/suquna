import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/model/myadds_model/my_ads_model.dart';

class MyAddsScreenController extends GetxController {
  String img =
      "https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3250.jpg?t=st=1709678575~exp=1709682175~hmac=8d048f8038853b8e8b572f57def5951f12cfb35ef89ac2534a468780fc08eb1a&w=740";

  @override
  void onInit() {
    print("my adds start");
    getMyadds();
    super.onInit();
  }

  MyAddsModel? myAddsModel;
  getMyadds() async {
    var response = await http.get(Uri.parse(ApiLinks.getMyadds),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      myAddsModel = MyAddsModel.fromJson(data);
      update();
      print(myAddsModel!.items![0].name);
    } else {
      print("error");
    }
    update();
  }

  deleteMyAdd(String id) async {
    var response = await http.delete(
        Uri.parse("${ApiLinks.addGetUpdateProducts}/:$id"),
        headers: header);
    if (response.statusCode == 200) {
      print(response.body);
      getMyadds();
      update();
    } else {
      print(response.statusCode);
    }
  }
}
