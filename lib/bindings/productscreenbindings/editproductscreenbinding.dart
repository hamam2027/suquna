import 'package:get/get.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/homescreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/myaddsscreencontroller.dart';
import 'package:suquna/controller/productscreencontroller/editproductscreencontroller.dart';
import 'package:suquna/controller/productscreencontroller/productscreencontroller.dart';

class EditProductScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProductScreenController>(
      () => EditProductScreenController(),
    );
    Get.lazyPut<ProductScreenController>(
      () => ProductScreenController(),
    );
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
    );
    Get.lazyPut<MyAddsScreenController>(
      () => MyAddsScreenController(),
    );
    Get.lazyPut<AccountScreenController>(
      () => AccountScreenController(),
    );
  }
}
