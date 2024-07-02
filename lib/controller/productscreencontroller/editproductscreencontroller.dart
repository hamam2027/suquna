import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/constant_text.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/homescreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/myaddsscreencontroller.dart';
import 'package:suquna/controller/productscreencontroller/productscreencontroller.dart';
import 'package:suquna/model/sellModels/addprodactmodel.dart';
import 'package:suquna/model/sellModels/sellmodel.dart';

class EditProductScreenController extends GetxController {
  int? categoryId;
  String? productId;
  GlobalKey<FormState> editproductKey = GlobalKey();
  ProductScreenController productScreenController = Get.find();
  HomeScreenController homeScreenController = Get.find();
  MyAddsScreenController myAddController = Get.find();
  AccountScreenController accountController = Get.find();

  SelectCatModel? selectCatModel;
  RxList<SelectCatModel> selectList = <SelectCatModel>[].obs;
  final FocusNode namefucas = FocusNode();
  final FocusNode pricefucas = FocusNode();
  final FocusNode descfucas = FocusNode();

  final TextEditingController editnameController = TextEditingController();
  final TextEditingController editpriceController = TextEditingController();
  final TextEditingController editdescriptionController =
      TextEditingController();
  Addprodactmodel? addprodactmodel;

  @override
  void onClose() {
    clearData();

    super.onClose();
  }

  @override
  void onInit() async {
    productId = await Get.arguments["id"];
    update();
    editgetselectcategory();

    super.onInit();
  }

  changeCatId(int id) {
    categoryId = id;
    update();
    print(categoryId);
  }

  final ImagePicker picker = ImagePicker();
  File? imagefile;
  XFile? image;
  List<XFile> imagesXfile = [];
  List<File> imagesFile = [];
  takelistOfphotoFromGalary() async {
    imagesXfile = await picker.pickMultiImage(imageQuality: 80, limit: 10);
    if (imagesXfile.isNotEmpty) {
      imagesXfile.forEach((element) {
        File img = File(element.path);
        if (imagesFile.length < 10) {
          imagesFile.add(img);
        }

        update();
      });
    }

    update();
  }

  takephotoFromGalary() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagefile = File(image!.path);
      imagesFile.add(imagefile!);
      update();
    }

    update();
  }

  clearData() {
    editnameController.clear();
    editpriceController.clear();
    editdescriptionController.clear();
    image = null;
  }

  editgetselectcategory() async {
    print("select category requist");
    var response = await http.get(
      Uri.parse(ApiLinks.selectCategory),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      data.forEach((element) {
        selectCatModel = SelectCatModel.fromJson(element);
        selectList.add(selectCatModel!);
        update();
      });
    } else {
      print(response.statusCode);
    }
  }

  editProdact() async {
    if (image != null) {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${ApiLinks.addGetUpdateProducts}/$productId"));
      request.fields.addAll({
        "name": editnameController.text,
        "price": editpriceController.text,
        "category_id": categoryId.toString(),
        "description": editdescriptionController.text,
      });
      request.files
          .add(await http.MultipartFile.fromPath('image', "${image!.path}"));
      request.headers.addAll({"Authorization": "Bearer $token"});

      var response = await request.send();
      if (response.statusCode == 200) {
        clearData();
        showToust(
          message: "succes",
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.successClr,
        );
        await homeScreenController.getAllcategory();
        await productScreenController.getProductDetailse();

        await accountController.getMyaddsAccount();
        await myAddController.getMyadds();
        // homeScreenController.getAllcategory();
        // myaddcontroller.getMyadds();
      } else {
        showToust(
          message: "error",
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.redcolor,
        );
      }
    } else {
      showToust(
        message: "يجب اختيار صورة على الاقل",
        textcolor: AppColors.whiteClr,
        backgroundclr: AppColors.redcolor,
      );
    }
  }
}
