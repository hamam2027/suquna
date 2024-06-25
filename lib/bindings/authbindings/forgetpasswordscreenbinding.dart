import 'package:get/get.dart';
import 'package:suquna/controller/authcontollers/forgetpasswordcontroller.dart';

class ForgetPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(
      () => ForgetPasswordController(),
    );
  }
}
