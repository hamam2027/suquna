import 'package:get/get.dart';
import 'package:suquna/controller/homescreeenscontollers/chatscreencontroller.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatScreenController>(
      () => ChatScreenController(),
    );
  }
}
