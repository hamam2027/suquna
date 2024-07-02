import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';
import 'package:suquna/view/homepagescreens/myaccount/accountwidgets/addandfavoratbtn.dart';
import 'package:suquna/view/homepagescreens/myaccount/accountwidgets/adds_account.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  AccountScreenController controller = Get.find();
    return GetBuilder<AccountScreenController>(builder: (controller) {
      return Container(
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
                  onPressed: () async {
                    await controller.UserlogOut();

                    Get.offAllNamed(AppRouter.signinscreen);
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
          body: controller.userData == null
              ? Center(child: CircularProgressIndicator())
              : Container(
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
                                  child: Container(
                                    width: 115,
                                    height: 115,
                                    clipBehavior: Clip.antiAlias,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://sq.sketch-test.com${controller.userData!.avatar!}",
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  color: AppColors.infoClr,
                                  onPressed: () {
                                    Get.toNamed(AppRouter.editprofile);
                                  },
                                  icon: Icon(
                                    Icons.settings,
                                    size: 30,
                                  )),
                              // MainButton(
                              //   minWidth: 0,
                              //   chil: "Edit ".tr,
                              //   styll: AppStyle.smallw,
                              //   colo: Colors.transparent,
                              //   function: () {
                              //     Get.toNamed(AppRouter.editprofile);
                              //   },
                              // ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    controller.userData!.name!,
                                    style: AppStyle.normalw,
                                  ),
                                  Text(
                                    controller.userData!.email!,
                                    style: AppStyle.normalw,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          MyAddsAndMyFavorate(),
                          SizedBox(
                            height: 10,
                          ),
                          controller.myadds!.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: controller.myadds!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRouter.productscreen,
                                              arguments: {
                                                "id":
                                                    controller.myadds![index].id
                                              });
                                        },
                                        child: AccountAdds(
                                          edit: () {
                                            Get.toNamed(
                                                AppRouter.editproductscreen,
                                                arguments: {
                                                  "id": controller
                                                      .myadds![index].id
                                                      .toString()
                                                });
                                          },
                                          deletAd: () {},
                                          name: controller.myadds![index].name!,
                                          description: controller
                                              .myadds![index].description!,
                                          imglink:
                                              "${ApiLinks.imagelink + controller.myadds![index].image!}",
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : controller.myFavorate!.isNotEmpty
                                  ? Expanded(
                                      child: ListView.builder(
                                        itemCount:
                                            controller.myFavorate!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRouter.productscreen,
                                                  arguments: {
                                                    "productId": controller
                                                        .myFavorate![index].id
                                                  });
                                            },
                                            child: AccountFavorate(
                                              ud: controller.ud,
                                              udi: controller
                                                  .myFavorate![index].id!,
                                              loding: controller.lodfavAndADD,
                                              name: controller
                                                  .myFavorate![index].name!,
                                              description: controller
                                                  .myFavorate![index]
                                                  .description!,
                                              imglink:
                                                  "${ApiLinks.imagelink + controller.myFavorate![index].image!}",
                                              removeAd: () {
                                                controller.removeFromFavorate(
                                                    controller
                                                        .myFavorate![index].id
                                                        .toString(),
                                                    controller
                                                        .myFavorate![index]
                                                        .id!);
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : SizedBox(),
                        ],
                      )),
                ),
        ),
      );
    });
  }
}
