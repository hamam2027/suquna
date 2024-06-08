import 'package:get/get.dart';
import 'package:suquna/bindings/accountscreenbinding.dart';
import 'package:suquna/bindings/categorybinding.dart';
import 'package:suquna/bindings/chatscreenbinding.dart';
import 'package:suquna/bindings/homscreenbinding.dart';
import 'package:suquna/bindings/myaddsscreenbinding.dart';
import 'package:suquna/bindings/sellscreenbinding.dart';
import 'package:suquna/view/category/categoryscreen.dart';
import 'package:suquna/view/homepage/homepage.dart';
import 'package:suquna/view/homepagescreens/chatscreen/chatscreen.dart';
import 'package:suquna/view/homepagescreens/homescreen/homescreen.dart';
import 'package:suquna/view/homepagescreens/myaccount/myaccount.dart';
import 'package:suquna/view/homepagescreens/myads/myadd.dart';
import 'package:suquna/view/homepagescreens/sell/sellscreen.dart';

import '../bindings/homebinding.dart';

class AppRouter {
  static String home = "/";
  static String getHomeRout() => home;
  static String chatscreen = "/chatscreen";
  static String homescreen = "/homescreen";
  static String sellscreen = "/sellscreen";
  static String myaddsscreen = "/myaddsscreen";
  static String accountscreen = "/accountscreen";
  static String categoryscreen = "/categoryscreen";

  static List<GetPage> routs = [
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: homescreen,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: chatscreen,
      page: () => ChatScreen(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: sellscreen,
      page: () => SellScreen(),
      binding: SellScreenBinding(),
    ),
    GetPage(
      name: myaddsscreen,
      page: () => MyAddScreen(),
      binding: MyAddsScreenBinding(),
    ),
    GetPage(
      name: accountscreen,
      page: () => AccountScreen(),
      binding: AccountScreenBinding(),
    ),
    GetPage(
      name: categoryscreen,
      page: () => CategoryScreen(),
      binding: CategoryScreenBinding(),
    ),
  ];
}
