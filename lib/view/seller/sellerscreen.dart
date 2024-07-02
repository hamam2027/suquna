import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/componant/cashedimage.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/sellercontrollers/sellercontroller.dart';

class SellerScreen extends GetView<Sellercontroller> {
  const SellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size divSize = MediaQuery.of(context).size;
    return MyMainContainer(
        child: Scaffold(
      appBar: AppBar(
        title: Text("صفحة البائع"),
      ),
      body: GetBuilder<Sellercontroller>(builder: (controller) {
        return controller.userModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: divSize.height * 0.15,
                      decoration: BoxDecoration(
                          color: AppColors.primaryClr2,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RichtExt(
                                    hdtext: 'name :  ',
                                    subtxt: controller.userModel!.name!,
                                  ),
                                  RichtExt(
                                    hdtext: 'age    :  ',
                                    subtxt: subtractDatesForyear(
                                            controller.userModel!.dob!)
                                        .toString(),
                                  ),
                                  RichtExt(
                                    hdtext: 'phone:  ',
                                    subtxt: controller.userModel!.phone!,
                                  ),
                                ],
                              )),
                          Expanded(
                            flex: 1,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: CachedImageCustom(
                                imageUrl:
                                    "${ApiLinks.imagelink + controller.userModel!.avatar!}",
                                fiit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
      }),
    ));
  }
}

class RichtExt extends StatelessWidget {
  const RichtExt({
    super.key,
    required this.hdtext,
    required this.subtxt,
  });
  final String hdtext;
  final String subtxt;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: hdtext, // النص الأول
        style: TextStyle(color: Colors.black, fontSize: 18), // نمط النص الأول
        children: <TextSpan>[
          TextSpan(
            text: subtxt, // النص الثاني
            style: AppStyle.largwb, // نمط النص الثاني
          ),
        ],
      ),
    );
  }
}
