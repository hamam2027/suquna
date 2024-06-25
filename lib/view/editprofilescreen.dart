import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/editprofilecontroller.dart';

class EditProfileScreen extends GetView<EditProfileScreenController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size devsiz = MediaQuery.of(context).size;
    return MyMainContainer(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "تعديل الملف الشخصي",
          style: AppStyle.largob,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GetBuilder<EditProfileScreenController>(
                          builder: (controller) {
                        return CircleAvatar(
                          backgroundImage: controller.imagefile != null
                              ? FileImage(controller.imagefile!)
                              : null,
                          radius: 75,
                        );
                      }),
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () async {
                              Get.bottomSheet(Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      gradient: AppStyle.linearGradient),
                                  height: 200,
                                  // color: Colors.white,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "صورة الملف الشخصي",
                                        style: AppStyle.normalw,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .takephotoFromCamera();
                                                  Get.back();
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        border: Border
                                                            .fromBorderSide(
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      Icons.camera_alt_outlined,
                                                      size: 40,
                                                      color: AppColors.whiteClr,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "الكاميرا",
                                                style: AppStyle.smallw,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .takephotoFromGalary();
                                                  Get.back();
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        border: Border
                                                            .fromBorderSide(
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      Icons.image,
                                                      size: 40,
                                                      color: AppColors.whiteClr,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "المعرض",
                                                style: AppStyle.smallw,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )));
                              // controller.takephotoFromCamera();
                            },
                            icon: Icon(Icons.camera_alt)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: MainformField(
                      hint: "الاسم الاول",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MainformField(
                      hint: "الاسم الاخير",
                    ),
                  ),
                ],
              ),
              MainformField(
                hint: "رقم الهاتف",
              ),
              MainformField(),
              MainformField(),
              MainformField(),
              SizedBox(
                height: devsiz.height / 15,
              ),
              MainButton(
                  chil: "حفظ التغييرات",
                  colo: AppColors.secondaryClr,
                  function: () {})
            ],
          ),
        ),
      ),
    ));
  }
}
