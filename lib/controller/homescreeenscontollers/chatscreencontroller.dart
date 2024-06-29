import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  String text = "all";

  @override
  void onInit() {
    super.onInit();
    print("chatScreen");
  }

  @override
  void onClose() {
    Get.delete<ChatScreenController>();
  }
}
