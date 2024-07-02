import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/componant/cashedimage.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/constant/constant_text.dart';
import 'package:suquna/controller/productscreencontroller/productscreencontroller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductScreen extends GetView<ProductScreenController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductScreenController controller = Get.find();
    Size devsize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(gradient: AppStyle.linearGradient),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "تفاصيل المنتج",
              style: AppStyle.largo,
            ),
          ),
          body: GetBuilder<ProductScreenController>(builder: (controller) {
            return Container(
              padding: EdgeInsets.all(10),
              child: controller.productModel == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Container(
                          height: devsize.height / 3.5,
                          child: Swiper(
                            autoplay: true,
                            loop: true,
                            outer: true,

                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: CachedImageCustom(
                                    imageUrl:
                                        "${ApiLinks.imagelink + controller.productModel!.image!}",
                                    fiit: BoxFit.contain,
                                  ));
                            },
                            itemCount: 3,
                            viewportFraction: 0.8,
                            scale: 0.8,
                            pagination: SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                activeColor:
                                    AppColors.whiteClr, // لون النقاط الفعالة
                                color: AppColors
                                    .primaryDark, // لون النقاط غير الفعالة
                                size: 10.0, // حجم النقاط غير الفعالة
                                activeSize: 20.0, // حجم النقاط الفعالة
                              ),
                            ),

                            // indicatorLayout: PageIndicatorLayout.SLIDE,
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              controller.productModel!.user!.id == id
                                  ? SizedBox()
                                  : SellerWidget(
                                      controller: controller,
                                    ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.primaryClr2),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Row(
                                            children: [
                                              Text(
                                                "السعر",
                                                style: AppStyle.largw,
                                              ),
                                              Spacer(),
                                              Text(
                                                "Sar ${controller.productModel!.price}",
                                                style: AppStyle.largob,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            child: IconButton(
                                                padding: EdgeInsets.zero,
                                                color: controller.productModel!
                                                        .wishlistedByUser!
                                                    ? const Color.fromARGB(
                                                        255, 253, 17, 0)
                                                    : Colors.grey,
                                                onPressed: () {},
                                                icon: Icon(Icons.favorite)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                        "${controller.productModel!.description}"),
                                    Text(
                                      ''' الوصف
لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور

أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد

أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس

أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت

نيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا

كيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.''',
                                      style: AppStyle.normalw,
                                    ),
                                    Text(
                                      "تم النشر منذ ${subtractDates(controller.productModel!.createdAt!)}",
                                      style: AppStyle.smallo,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                        Container(
                          child: controller.productModel!.user!.id == id
                              ? Row(
                                  children: [
                                    Expanded(
                                        child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: EdgeInsets.all(10),
                                      color: AppColors.infoClr,
                                      onPressed: () {
                                        Get.toNamed(AppRouter.editproductscreen,
                                            arguments: {
                                              "id": controller.productModel!.id
                                                  .toString()
                                            });
                                      },
                                      child: Text(
                                        "تعديل",
                                        style: AppStyle.normalw,
                                      ),
                                    )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: EdgeInsets.all(10),
                                      color: AppColors.infoClr,
                                      onPressed: () {
                                        // _makePhoneCall(
                                        //     "tel:${controller.productModel!.user!.phone!}");
                                      },
                                      child: Text(
                                        "حذف",
                                        style: AppStyle.normalw,
                                      ),
                                    )),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                        child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: EdgeInsets.all(10),
                                      color: AppColors.infoClr,
                                      onPressed: () {
                                        Get.toNamed(AppRouter.chatPagecreen);
                                      },
                                      child: Icon(
                                        Icons.message,
                                        color: AppColors.whiteClr,
                                        size: 30,
                                      ),
                                    )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: EdgeInsets.all(10),
                                      color: AppColors.infoClr,
                                      onPressed: () {
                                        _makePhoneCall(
                                            "tel:${controller.productModel!.user!.phone!}");
                                      },
                                      child: Icon(
                                        Icons.call,
                                        color: AppColors.whiteClr,
                                        size: 30,
                                      ),
                                    )),
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

class SellerWidget extends StatelessWidget {
  const SellerWidget({
    super.key,
    required this.controller,
  });
  final ProductScreenController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.sellerScreen,
            arguments: {"seller": jsonEncode(controller.productModel!.user)});
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.primaryClr2),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.productModel!.user!.id == id
                      ? Text(
                          "التاجر / انت",
                          style: AppStyle.normalw,
                        )
                      : Text(
                          "التاجر / ${controller.productModel!.user!.name}",
                          style: AppStyle.normalw,
                        ),
                  Text(
                    "الدولة / ${controller.productModel!.user!.address}",
                    style: AppStyle.normalw,
                  ),
                  Text(
                      "عضو منذ ${subtractDates(controller.productModel!.user!.createdAt!)}"),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CachedImageCustom(
                  imageUrl:
                      "${ApiLinks.imagelink + controller.productModel!.user!.avatar!}",
                  fiit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _makePhoneCall(String url) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    throw 'Could not launch $url';
  }
}
