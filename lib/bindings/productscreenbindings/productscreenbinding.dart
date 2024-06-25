import 'package:get/get.dart';
import 'package:suquna/controller/productscreencontroller/productscreencontroller.dart';

class ProductScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductScreenController>(
      () => ProductScreenController(),
    );
  }
}
