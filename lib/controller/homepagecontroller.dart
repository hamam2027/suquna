import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/controller/accountscreencontroller.dart';
import 'package:suquna/controller/chatscreencontroller.dart';
import 'package:suquna/controller/homescreencontroller.dart';
import 'package:suquna/controller/myaddsscreencontroller.dart';
import 'package:suquna/controller/sellscreencontroller.dart';
import 'package:suquna/view/homepagescreens/chatscreen/chatscreen.dart';
import 'package:suquna/view/homepagescreens/homescreen/homescreen.dart';
import 'package:suquna/view/homepagescreens/myaccount/myaccount.dart';
import 'package:suquna/view/homepagescreens/myads/myadd.dart';
import 'package:suquna/view/homepagescreens/sell/sellscreen.dart';

class HomePageController extends GetxController {
  int currentindex = 0;
  changCurrentIndex(index) {
    currentindex = index;
    update();
  }

  List<dynamic> controllers = [
    HomeScreenController(),
    ChatScreenController(),
    SellScreenController(),
    MyAddsScreenController(),
    AccountScreenController(),
  ];

  List<Widget> pages = [
    const HomeScreen(),
    const ChatScreen(),
    const SellScreen(),
    const MyAddScreen(),
    const AccountScreen(),
  ];
}
