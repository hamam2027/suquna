import 'package:get/get.dart';
import 'package:suquna/controller/accountscreencontroller.dart';
import 'package:suquna/controller/chatscreencontroller.dart';
import 'package:suquna/controller/homescreencontroller.dart';
import 'package:suquna/controller/myaddsscreencontroller.dart';
import 'package:suquna/controller/sellscreencontroller.dart';

import '../controller/homepagecontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
    );
    Get.lazyPut<ChatScreenController>(
      () => ChatScreenController(),
    );
    Get.lazyPut<SellScreenController>(
      () => SellScreenController(),
    );
    Get.lazyPut<MyAddsScreenController>(
      () => MyAddsScreenController(),
    );
    Get.lazyPut<AccountScreenController>(
      () => AccountScreenController(),
    );
  }
}
