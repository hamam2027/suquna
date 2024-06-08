import 'package:get/get.dart';
import 'package:suquna/controller/homescreencontroller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
    );
  }
}
