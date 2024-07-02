import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/constant_text.dart';
import 'package:suquna/model/product_model/productmodel.dart';

class ProductScreenController extends GetxController {
  ProductModel? productModel;
  late String productid;
  @override
  void onInit() {
    productid = Get.arguments["id"].toString();
    print(productid);

    getProductDetailse();
    super.onInit();
  }

  getProductDetailse() async {
    try {
      var response = await http.get(
        Uri.parse("${ApiLinks.addGetUpdateProducts}/$productid"),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        productModel = ProductModel.fromJson(data);
        print(productModel!.name);
        update();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
