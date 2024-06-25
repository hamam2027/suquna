import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  String text = "all";

  @override
  void onInit() {
    print("object");
  }

  @override
  void onClose() {
    Get.delete<ChatScreenController>();
  }
}
