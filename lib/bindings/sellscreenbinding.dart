import 'package:get/get.dart';
import 'package:suquna/controller/sellscreencontroller.dart';

class SellScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellScreenController>(
      () => SellScreenController(),
    );
  }
}
