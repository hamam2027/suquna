import 'package:get/get.dart';
import 'package:suquna/controller/authcontollers/signincontroller.dart';

class SignInScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
  }
}
