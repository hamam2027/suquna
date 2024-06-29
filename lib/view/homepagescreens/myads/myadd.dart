import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/myaddsscreencontroller.dart';

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
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.myAddsModel!.items!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: devsize.height / 5,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: CachedNetworkImage(
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: AppColors.primaryClr,
                                  highlightColor: AppColors.grayClr,
                                  child: Container(
                                    child: Center(
                                      child: Text("loding"),
                                    ),
                                  ),
                                ),
                                imageUrl:
                                    "${ApiLinks.imagelink + controller.myAddsModel!.items![index].image!}",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.myAddsModel!.items![index].name!,
                                    style: AppStyle.normalb,
                                  ),
                                  Expanded(
                                      child: Text(
                                    controller.myAddsModel!.items![index]
                                        .description!,
                                  )),
                                  // Spacer(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: EdgeInsets.all(5),
                                          color: AppColors.infoClr,
                                          onPressed: () {},
                                          child: Text("تعديل"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: EdgeInsets.all(5),
                                          color: AppColors.warningClr,
                                          onPressed: () {
                                            print(controller
                                                .myAddsModel!.items![index].id);
                                            // controller.deleteMyAdd(
                                            //   controller
                                            //       .myAddsModel!.items![index].id
                                            //       .toString(),
                                            // );
                                          },
                                          child: Text("حذف"),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
