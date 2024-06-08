import 'package:get/get.dart';
import 'package:suquna/controller/categorycontroller.dart';

class CategoryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryScreenController>(
      () => CategoryScreenController(),
    );
  }
}
