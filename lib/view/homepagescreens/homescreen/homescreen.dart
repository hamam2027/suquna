import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/homescreencontroller.dart';
import 'package:suquna/view/homepagescreens/homescreen/homescreen_widgets/home_screen_drawer.dart';
import 'package:suquna/view/homepagescreens/homescreen/homescreen_widgets/homescreen_loding.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
        drawer: HomeScreenDrawer(),
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
                        ? CategorisLoding()
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
                      ? HomeScreenProductsLoding(div: div)
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: div.height * 0.40,
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
                                      height: div.height / 3,
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
                                                    "id": controller
                                                        .categoryList[index]
                                                        .products![i]
                                                        .id
                                                  });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              height: div.height / 3,
                                              width: div.height / 5,
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

                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.topEnd,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: SizedBox(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              CachedNetworkImage(
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
                                                                        .price!,
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
                                                                      .products![
                                                                          i]
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
                                                                      .products![
                                                                          i]
                                                                      .createdAt!
                                                                      .substring(
                                                                          0,
                                                                          10),
                                                                ),
                                                              ],
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                  (controller.loding == true &&
                                                          controller.uim ==
                                                              controller
                                                                  .categoryList[
                                                                      index]
                                                                  .products![i]
                                                                  .id)
                                                      ? CircularProgressIndicator(
                                                          color: AppColors
                                                              .secondaryClr,
                                                        )
                                                      : IconButton(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          onPressed: () {
                                                            print("index${i}");

                                                            controller
                                                                .addToFavorate(
                                                              controller
                                                                  .categoryList[
                                                                      index]
                                                                  .products![i]
                                                                  .id
                                                                  .toString(),
                                                              controller
                                                                  .categoryList[
                                                                      index]
                                                                  .products![i]
                                                                  .id!,
                                                            );
                                                          },
                                                          icon: Icon(
                                                            Icons.favorite,
                                                            size: 30,
                                                            color: controller
                                                                        .categoryList[
                                                                            index]
                                                                        .products![
                                                                            i]
                                                                        .wishlistedByUser ==
                                                                    false
                                                                ? AppColors
                                                                    .grayClr
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        2,
                                                                        18),
                                                          )),
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
