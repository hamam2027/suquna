import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/myaddsscreencontroller.dart';
import 'package:suquna/view/homepagescreens/myads/myaddswidgets/addwidget.dart';
import 'package:shimmer/shimmer.dart';

class MyAddScreen extends StatelessWidget {
  MyAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyAddsScreenController controller = Get.find();
    Size devsize = MediaQuery.of(context).size;
    return MyMainContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "اعلاناتي",
            style: AppStyle.largo,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<MyAddsScreenController>(builder: (controller) {
          return controller.myAddsModel == null
              ? ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                      baseColor: AppColors.primaryClr,
                      highlightColor: AppColors.grayClr,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        height: devsize.height * 0.20,
                        decoration: BoxDecoration(
                            color: AppColors.whiteClr,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  },
                )
              : controller.myAddsModel!.items!.isEmpty
                  ? Center(
                      child: Text(
                        "لا يوجد اعلانات بعد",
                        style: AppStyle.normalw,
                      ),
                    )
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.myAddsModel!.items!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRouter.productscreen, arguments: {
                              "id": controller.myAddsModel!.items![index].id
                            });
                          },
                          child: MyAddWidget(
                            devsize: devsize,
                            name: controller.myAddsModel!.items![index].name!,
                            description: controller
                                .myAddsModel!.items![index].description!,
                            imageUrl:
                                "${ApiLinks.imagelink + controller.myAddsModel!.items![index].image!}",
                            delete: () {},
                            edit: () {
                              Get.toNamed(AppRouter.editproductscreen,
                                  arguments: {
                                    "id": controller
                                        .myAddsModel!.items![index].id
                                        .toString()
                                  });
                            },
                          ),
                        );
                      },
                    );
        }),
      ),
    );
  }
}
