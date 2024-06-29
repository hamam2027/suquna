import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/chatscreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/homescreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/myaddsscreencontroller.dart';
import 'package:suquna/controller/homescreeenscontollers/sellscreencontroller.dart';
import 'package:suquna/view/homepagescreens/chatscreen/chatscreen.dart';
import 'package:suquna/view/homepagescreens/homescreen/homescreen.dart';
import 'package:suquna/view/homepagescreens/myaccount/myaccount.dart';
import 'package:suquna/view/homepagescreens/myads/myadd.dart';
import 'package:suquna/view/homepagescreens/sell/sellscreen.dart';

class HomePageController extends GetxController {
  // int currentindex = 0;
  // changCurrentIndex(index) {

  //   currentindex = index;
  //   update();
  // }

  List<Widget> pagess = [
    HomeScreen(),
    ChatScreen(),
    SellScreen(),
    MyAddScreen(),
    AccountScreen(),
  ];
  @override
  void onInit() {
    print("homePage");
    super.onInit();
  }

  int currentindex = 0;
  changCurrentIndex(index) {
    // print(currentindex);

    if (index != currentindex) {
      deleteController(currentindex);
      update();
      updatecontroller(index);
      update();
    }

    currentindex = index;
    // print(currentindex);

    update();
  }

  void deleteController(int index) {
    print("delete");

    switch (index) {
      case 0:
        Get.delete<HomeScreenController>();
        break;
      case 1:
        Get.delete<ChatScreenController>();
        break;
      case 2:
        Get.delete<SellScreenController>();
        break;
      case 3:
        Get.delete<MyAddsScreenController>();
        break;
      case 4:
        Get.delete<AccountScreenController>();
        break;
    }
  }

  updatecontroller(int index) {
    print("update");
    switch (index) {
      case 0:
        Get.lazyPut<HomeScreenController>(
          () => HomeScreenController(),
        );

        break;
      case 1:
        Get.lazyPut<ChatScreenController>(
          () => ChatScreenController(),
        );

        break;

      case 2:
        Get.lazyPut<SellScreenController>(
          () => SellScreenController(),
        );

        break;

      case 3:
        Get.lazyPut<MyAddsScreenController>(
          () => MyAddsScreenController(),
        );

        break;

      case 4:
        Get.lazyPut<AccountScreenController>(
          () => AccountScreenController(),
        );

        break;
    }
  }
}
