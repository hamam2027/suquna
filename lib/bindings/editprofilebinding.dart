import 'package:get/get.dart';
import 'package:suquna/controller/editprofilecontroller.dart';

class EditProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileScreenController>(
        () => EditProfileScreenController());
  }
}
