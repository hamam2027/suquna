import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AccountScreenController controller = Get.find();
    return GetBuilder<AccountScreenController>(builder: (controller) {
      return controller.isloding
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Row(
                    children: [
                      Text(
                        "Profile".tr,
                        style: AppStyle.normalo,
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: () {
                          controller.logOut();
                        },
                        child: Row(
                          children: [
                            Text("خروج"),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                body: Container(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    CarouselSlider(
                                      items: List.generate(
                                          5,
                                          (index) => Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                width: double.infinity,
                                                child: Image.asset(
                                                  "assets/images/advertsment.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              )),
                                      options: CarouselOptions(
                                        height: 150,
                                        viewportFraction: 1,
                                        autoPlay: true,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: CircleAvatar(
                                  radius: 65,
                                  backgroundColor:
                                      AppColors.primaryClr.withOpacity(0.5),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://sq.sketch-test.com${controller.userData!.avatar!}"),
                                    radius: 60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            controller.userData!.name!,
                            style: AppStyle.normalw,
                          ),
                          Text(
                            controller.userData!.email!,
                            style: AppStyle.normalw,
                          ),
                          MainButton(
                            minWidth: 0,
                            chil: "Edit Profile".tr,
                            styll: AppStyle.smallw,
                            colo: Colors.transparent,
                            function: () {
                              Get.toNamed(AppRouter.editprofile);
                            },
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(
                                    2,
                                    (index) => MaterialButton(
                                          color: AppColors.whiteClr,
                                          onPressed: () {},
                                          child: Text("اعلاناتي"),
                                        ))
                              ])
                        ],
                      )),
                ),
              ),
            );
    });
  }
}
