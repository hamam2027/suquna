import 'package:get/get.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/chatscreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/homescreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/myaddsscreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/sellscreencontroller.dart';

import '../../controller/homescreeenscontollers/homepagecontroller.dart';

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
