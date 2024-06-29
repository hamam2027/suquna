import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/model/category_products/category_product_model.dart';

class CategoryScreenController extends GetxController {
  late String id;
  @override
  void onInit() {
    id = Get.arguments["id"].toString();
    print(id);
    update();

    getAllCategoryProduct();
    super.onInit();
  }

  List<CategoryProductsModel> listproductCategory = [];
  CategoryProductsModel? categoryProductsModel;

  getAllCategoryProduct() async {
    listproductCategory = [];
    update();
    try {
      var response = await http.get(
          Uri.parse(
            "${ApiLinks.getCategoriesProduct}/$id",
          ),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        data.forEach((element) {
          categoryProductsModel = CategoryProductsModel.fromJson(element);
          listproductCategory.add(categoryProductsModel!);
          print(listproductCategory[0].name);
        });
        update();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
