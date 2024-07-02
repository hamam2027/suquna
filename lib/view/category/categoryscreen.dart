import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/categorycontroller.dart';

class CategoryScreen extends GetView<CategoryScreenController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryScreenController controller = Get.find();
    Size div = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      decoration: BoxDecoration(gradient: AppStyle.linearGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("category"),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Center(
                    child: Text("ضع اعلانك هنا"),
                  ),
                ),
                GetBuilder<CategoryScreenController>(builder: (controller) {
                  return controller.listproductCategory.isEmpty
                      ? CircularProgressIndicator()
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.7,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemCount: controller.listproductCategory.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              highlightColor: Colors.transparent,
                              // hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              autofocus: false,
                              // hoverColor: AppConst.secandrycolor,
                              onTap: () async {
                                // func();
                                Get.toNamed(AppRouter.productscreen,
                                    arguments: {
                                      "id": controller
                                          .listproductCategory[index].id
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                height: orientation == Orientation.portrait
                                    ? div.height / 3
                                    : div.width / 3,
                                width: orientation == Orientation.portrait
                                    ? div.height / 5
                                    : div.width / 5,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    border: Border.all(
                                        color: AppColors.secondaryClr,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                // margin: const EdgeInsets.symmetric(horizontal: 10),

                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: Image.network(
                                          "${ApiLinks.imagelink + controller.listproductCategory[index].image!}",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Sar 1000",
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons
                                                              .favorite_outline_outlined,
                                                          color: Colors.amber,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "title$index",
                                              ),
                                              const Text("location"),
                                              const Text("8 days ago"),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                // width: 250,
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
