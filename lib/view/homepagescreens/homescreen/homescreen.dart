import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/homescreencontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.find();
    Size div = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.transparent,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: AppColors.whiteClr,
                )),
          ],
          title: Container(
            height: 40,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: TextFormField(
                style:
                    AppStyle.normalw.copyWith(decoration: TextDecoration.none),
                decoration: InputDecoration(
                  hintText: 'Select Country & City'.tr,
                  hintStyle: AppStyle.smallw,
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.only(bottom: 10),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColors.primaryClr2,
                  // fillColor: AppColors.primaryLight,
                ),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          shape: RoundedRectangleBorder(),
          backgroundColor: AppColors.primaryDark,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: CircleAvatar(
                      backgroundColor: AppColors.dangerClr,
                      child: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                    color: AppColors.blackClr,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...List.generate(
                      6,
                      (index) => Container(
                            decoration: BoxDecoration(
                                color: AppColors.whiteClr,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/icon$index.png",
                                width: 40,
                              ),
                              title: Text(drawestring[index].tr),
                            ),
                          )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Change Language".tr,
                        ),
                        DropdownButtonFormField(
                          value: "العربية",
                          items: langDropdownItemsMenus,
                          onChanged: (value) {
                            var getstorage = GetStorage();
                            late Locale local;
                            if (value == 'English') {
                              getstorage.write('lang', "en_US");
                              local = const Locale("en_US");
                              Get.updateLocale(local);
                              // Get.appUpdate();
                              print(local);
                            } else {
                              getstorage.write('lang', "ar_EG");
                              local = const Locale("ar_EG");
                              Get.updateLocale(local);
                              // Get.appUpdate();
                              print(local);
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: const WaterDropHeader(),
          controller: controller.refreshController,
          onRefresh: () async {
            final result = await controller.getAllcategory();
            if (result != null) {
              controller.refreshController.refreshCompleted();
            } else {
              controller.refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await controller.getAllcategory();
            if (result != null) {
              controller.refreshController.loadComplete();
            } else {
              controller.refreshController.loadFailed();
            }
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     MaterialButton(
                //       padding:
                //           const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                //       onPressed: () {},
                //       child: const Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Icon(Icons.location_pin),
                //           Text("Syria"),
                //           Icon(Icons.arrow_drop_down)
                //         ],
                //       ),
                //     ),
                //     IconButton(
                //         onPressed: () {},
                //         icon: const Icon(
                //           Icons.notifications_none_outlined,
                //           color: Colors.black,
                //         ))
                //   ],
                // ),
                SizedBox(
                  height: 50,
                  child: NeonSearchBar(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    onSearchChanged: (p0) {
                      print(p0);
                    },
                    borderColor: AppColors.secondaryClr,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Explore categories"),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(color: AppColors.blackClr),
                        ))
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: GetBuilder<HomeScreenController>(
                    builder: (controller) => controller.categoryList.isEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  height: 120,
                                  width: 100,
                                  margin: EdgeInsets.all(5),
                                  child: Shimmer.fromColors(
                                      baseColor: AppColors.primaryClr,
                                      highlightColor: AppColors.secondaryClr,
                                      child: Text("loding")));
                            },
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                padding: const EdgeInsets.all(5),
                                // color: Colors.blue,
                                height: 120,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.grayClr
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.network(
                                          "${ApiLinks.imagelink + controller.categoryList[index].image!}",
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        controller.categoryList[index].name!,
                                        style: const TextStyle(
                                            fontSize: 12, height: 1.2),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Image.network(
                        "https://img.freepik.com/free-vector/hand-drawn-flea-market-shopping-sale-banner-template_23-2149585836.jpg?t=st=1709676906~exp=1709680506~hmac=16b5fe6adf708efeaab6621be0f8fc1063cb3fcf93c63d17fe2005e39586333e&w=1060")),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<HomeScreenController>(builder: (controller) {
                  return controller.categoryList.isEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 250,
                                      width: div.width * 0.4,
                                      margin: EdgeInsets.all(5),
                                      child: Center(
                                        child: Shimmer.fromColors(
                                            baseColor: AppColors.primaryClr,
                                            highlightColor:
                                                AppColors.secondaryClr,
                                            child: Text("loding")),
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                      height: 250,
                                      width: div.width * 0.4,
                                      margin: EdgeInsets.all(5),
                                      child: Center(
                                        child: Shimmer.fromColors(
                                            baseColor: AppColors.primaryClr,
                                            highlightColor:
                                                AppColors.secondaryClr,
                                            child: Text("loding")),
                                      )),
                                ),
                              ],
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: orientation == Orientation.portrait
                                  ? div.height * 0.40
                                  : div.width * 0.40,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.categoryList[index].name!,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(
                                                AppRouter.categoryscreen,
                                                arguments: {
                                                  "id": controller
                                                      .categoryList[index].id
                                                });
                                          },
                                          child: const NeonText(
                                            spreadColor: AppColors.secondaryClr,
                                            text: "See all",
                                            textSize: 14,
                                            textColor: Colors.black,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          orientation == Orientation.portrait
                                              ? div.height / 3
                                              : div.width / 3,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller
                                            .categoryList[index]
                                            .products!
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int i) {
                                          return GestureDetector(
                                            onTap: () async {
                                              // func();
                                              Get.toNamed(
                                                  AppRouter.productscreen,
                                                  arguments: {
                                                    "productId": controller
                                                        .categoryList[index]
                                                        .products![i]
                                                        .id,
                                                  });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              height: orientation ==
                                                      Orientation.portrait
                                                  ? div.height / 3
                                                  : div.width / 3,
                                              width: orientation ==
                                                      Orientation.portrait
                                                  ? div.height / 5
                                                  : div.width / 5,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  border: Border.all(
                                                      color: AppColors
                                                          .secondaryClr,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),

                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.contain,
                                                        imageUrl:
                                                            "${ApiLinks.imagelink + controller.categoryList[index].products![i].image!}",
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      controller
                                                                          .categoryList[
                                                                              index]
                                                                          .products![
                                                                              i]
                                                                          .price!,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  IconButton(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      onPressed:
                                                                          () {},
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .favorite_outline_outlined,
                                                                        color: Colors
                                                                            .amber,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              controller
                                                                  .categoryList[
                                                                      index]
                                                                  .products![i]
                                                                  .name!,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                controller
                                                                    .categoryList[
                                                                        index]
                                                                    .products![
                                                                        i]
                                                                    .description!,
                                                              ),
                                                            ),
                                                            Text(
                                                              controller
                                                                  .categoryList[
                                                                      index]
                                                                  .products![i]
                                                                  .createdAt!
                                                                  .substring(
                                                                      0, 10),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              // width: 250,
                                            ),
                                          );
                                        },
                                      )),
                                ],
                              ),
                            );
                          },
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<DropdownMenuItem<String>> langDropdownItemsMenus = langList
    .map((String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ))
    .toList();
const langList = <String>[
  'العربية',
  'English',
];
List<String> drawestring = [
  'Fire Ad',
  'Technical support',
  'About our market',
  'packages',
  'Politics and Ethics',
  'Marketing window',
  "Change Language",
];
