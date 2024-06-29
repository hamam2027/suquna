import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:suquna/approuter/network_info.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/model/sellModels/addprodactmodel.dart';
import 'package:suquna/model/sellModels/sellmodel.dart';

class SellScreenController extends GetxController {
  int? categoryId;
  GlobalKey<FormState> formkey = GlobalKey();
  // MyAddsScreenController myaddcontroller = Get.find();
  // HomeScreenController homeScreenController = Get.find();

  SelectCatModel? selectCatModel;
  RxList<SelectCatModel> selectList = <SelectCatModel>[].obs;
  final FocusNode namefucas = FocusNode();
  final FocusNode pricefucas = FocusNode();
  final FocusNode descfucas = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Addprodactmodel? addprodactmodel;

  @override
  void onClose() {
    clearData();

    super.onClose();
  }

  @override
  void onReady() {
    print("SellScreen");
    super.onReady();
  }

  @override
  void onInit() {
    getselectcategory();

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
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    image = null;
    update();
  }

  getselectcategory() async {
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

  addProdactFromSell() async {
    if (image != null) {
      var heder = {
        "Authorization": "Bearer $token",
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse(ApiLinks.addGetUpdateProducts));
      request.fields.addAll({
        "name": nameController.text,
        "price": priceController.text,
        "category_id": categoryId.toString(),
        "description": descriptionController.text,
      });
      request.files
          .add(await http.MultipartFile.fromPath('image', "${image!.path}"));
      request.headers.addAll(heder);

      var response = await request.send();
      if (response.statusCode == 200) {
        clearData();
        showToust(
          message: "succes",
          textcolor: AppColors.whiteClr,
          backgroundclr: AppColors.successClr,
        );
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
