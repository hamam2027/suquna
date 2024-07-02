import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/controller/homescreeenscontollers/accountscreencontroller.dart';
import 'package:shimmer/shimmer.dart';

class MyAddsAndMyFavorate extends StatelessWidget {
  MyAddsAndMyFavorate({
    super.key,
  });
  AccountScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountScreenController>(builder: (controller) {
      return controller.lodfavAndADD
          ? Center(
              child: Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.all(10),
              ),
              baseColor: AppColors.primaryClr,
              highlightColor: AppColors.secondaryClr,
            ))
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: controller.myAdd
                        ? AppColors.secondaryClr
                        : AppColors.whiteClr,
                    minWidth: double.infinity,
                    onPressed: () {
                      controller.myadds!.isEmpty
                          ? controller.getMyaddsAccount()
                          : null;
                    },
                    child: Text("اعلاناتي"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: controller.myFav
                        ? AppColors.secondaryClr
                        : AppColors.whiteClr,
                    minWidth: double.infinity,
                    onPressed: () {
                      controller.myFavorate!.isEmpty
                          ? controller.getUserFavorate()
                          : null;
                    },
                    child: Text("المفضلة"),
                  ),
                ),
              ),
            ]);
    });
  }
}
