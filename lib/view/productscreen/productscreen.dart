import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/productscreencontroller/productscreencontroller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductScreen extends GetView<ProductScreenController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: devsize.height / 3.5,
                  child: Swiper(
                    loop: false,
                    outer: true,

                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                          "https://via.placeholder.com/288x188",
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    itemCount: 10,
                    viewportFraction: 0.8,
                    scale: 0.8,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor: AppColors.whiteClr, // لون النقاط الفعالة
                        color: AppColors.primaryDark, // لون النقاط غير الفعالة
                        size: 10.0, // حجم النقاط غير الفعالة
                        activeSize: 20.0, // حجم النقاط الفعالة
                      ),
                    ),

                    // indicatorLayout: PageIndicatorLayout.SLIDE,
                  ),
                ),
                Spacer(),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
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
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        color: AppColors.infoClr,
                        onPressed: () {
                          _makePhoneCall("tel:01241356890");
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
          ),
        ));
  }
}

void _makePhoneCall(String url) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    throw 'Could not launch $url';
  }
  // if (!await launchUrl(Uri.parse(url))) {
  //   throw 'Could not launch $url';
  // } else {
  //   await launchUrl(Uri.parse(url));
  // }
}
