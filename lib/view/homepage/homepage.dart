import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homepagecontroller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});
  // final HomePageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppStyle.linearGradient),
      child: GetBuilder<HomePageController>(builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          extendBodyBehindAppBar: false,
          bottomNavigationBar: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: BottomNavigationBar(
              currentIndex: controller.currentindex,
              onTap: (value) {
                controller.changCurrentIndex(value);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.secondaryClr,

              useLegacyColorScheme: true,
              elevation: 0,
              // backgroundColor: Colors.teal,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_circle_rounded,
                      size: 30,
                      color: Color.fromARGB(255, 253, 18, 1),
                    ),
                    label: "Sell"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: "My Ads"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Account"),
              ],
            ),
          ),
          body: SafeArea(
              child: Container(
            child: controller.pages[controller.currentindex],
          )),
        );
      }),
    );
  }
}
