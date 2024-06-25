import 'package:get/get.dart';
import 'package:suquna/controller/authcontollers/signupcontroller.dart';

class SignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}
