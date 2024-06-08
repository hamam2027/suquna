import 'package:get/get.dart';
import 'package:suquna/controller/accountscreencontroller.dart';

class AccountScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountScreenController>(
      () => AccountScreenController(),
    );
  }
}
