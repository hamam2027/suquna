import 'package:get/get.dart';
import 'package:suquna/controller/homescreeenscontollers/myaddsscreencontroller.dart';

class MyAddsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAddsScreenController>(
      () => MyAddsScreenController(),
    );
  }
}
