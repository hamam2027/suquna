import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/sellscreencontroller.dart';

class SellScreen extends GetView<SellScreenController> {
  SellScreen({super.key});

  final FocusNode advfucas = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size devsiz = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("اعلان جديد"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "اختر الفئة",
                style: AppStyle.normalw,
              ),
              Container(
                height: devsiz.height / 10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: devsiz.height / 5,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.secondaryClr),
                      padding: EdgeInsets.all(10),
                      child: Center(
                          child: Text(
                              textAlign: TextAlign.center, departments[index])),
                    );
                  },
                ),
              ),
              SizedBox(
                height: devsiz.height / 20,
              ),
              MainformField(
                preicon: Icons.store,
                hint: "عنوان الاعلان",
                controller: controller.advcontroller,
                type: TextInputType.text,
                focusNode: advfucas,
              ),
              MainformField(
                preicon: Icons.price_check_outlined,
                hint: "سعر",
                controller: controller.advcontroller,
                type: TextInputType.text,
                focusNode: advfucas,
              ),
              MainformField(
                preicon: Icons.location_on,
                hint: "سوريا / الرقة",
                controller: controller.advcontroller,
                type: TextInputType.text,
                focusNode: advfucas,
              ),
              MainformField(
                maxLin: 7,
                // preicon: Icons.location_on,
                hint: "الوصف",
                controller: controller.advcontroller,
                type: TextInputType.text,
                focusNode: advfucas,
              ),
              GetBuilder<SellScreenController>(builder: (controller) {
                return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primaryClr2),
                    child: controller.imagesFile.isEmpty
                        ? Center(
                            child: GestureDetector(
                              onTap: () {
                                controller.takephotoFromGalary();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.grayClr),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.add_a_photo_rounded,
                                      color: AppColors.infoClr,
                                    ),
                                    Text(
                                      "اضافة صور",
                                      style: AppStyle.normalw,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.takephotoFromGalary();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColors.grayClr),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.add_a_photo_rounded,
                                          color: AppColors.infoClr,
                                        ),
                                        Text(
                                          "اضافة صور",
                                          style: AppStyle.normalw,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ...List.generate(
                                    controller.imagesFile.length,
                                    (index) => Container(
                                          margin: EdgeInsets.all(5),
                                          child: Stack(
                                            alignment: Alignment.topLeft,
                                            children: [
                                              Image.file(
                                                controller.imagesFile[index],
                                                height: 60,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.imagesFile.remove(
                                                      controller
                                                          .imagesFile[index]);
                                                  controller.update();
                                                },
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  child: Icon(
                                                    Icons.close_rounded,
                                                    size: 14,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                              ],
                            ),
                          ));
              }),
              MainButton(
                  chil: "post add",
                  colo: AppColors.secondaryClr,
                  function: () {})
            ],
          ),
        ),
      ),
    );
  }
}

List<String> departments = [
  "Electronics",
  "Clothing and Fashion",
  "Furniture and Home",
  "Health and Beauty",
  "Food and Beverages",
  "Books and Media",
  "Gifts and Handicrafts",
  "Sports and Hobbies",
  "Pets",
  "Travel and Tourism"
];
