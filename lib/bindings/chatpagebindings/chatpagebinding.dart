import 'package:get/get.dart';
import 'package:suquna/controller/chatpagecontroller/chatpagecontroller.dart';

class ChatPageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatPageScreenController>(
      () => ChatPageScreenController(),
    );
  }
}
