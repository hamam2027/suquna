// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/applinks.dart';
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
                          backgroundImage: controller.image != null
                              ? FileImage(controller.imagefile!)
                              : controller.user != null
                                  ? NetworkImage(
                                          "${ApiLinks.imagelink + controller.user!.avatar!}")
                                      as ImageProvider
                                  : null,
                          // :null,
                          radius: 75,
                        );
                      }),
                      TakeImageWidget(controller: controller)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GetBuilder<EditProfileScreenController>(builder: (controller) {
                return Form(
                    key: controller.editProfileKey,
                    child: Column(
                      children: [
                        MainformField(
                          controller: controller.editNamecontroller,
                          hint: "الاسم",
                        ),
                        MainformField(
                          controller: controller.editphonecontroller,
                          hint: "رقم الهاتف",
                        ),
                        FormForEditCountry(
                          edicountry: controller.editCountry,
                          onchang: (value) {
                            controller.changCountry(value);
                            print(controller.editCountry);
                          },
                        ),

                        FormForDate(
                          controller: controller.editdatecontroller,
                          calendericon: Icons.calendar_month,
                          datepic: () async {
                            controller.changeDate(context);
                          },
                        ),
                        // MainformField(),
                        // MainformField(),
                        SizedBox(
                          height: devsiz.height / 15,
                        ),
                        GenderWidget(controller: controller),
                      ],
                    ));
              }),
              GetBuilder<EditProfileScreenController>(builder: (controller) {
                return controller.isloode
                    ? ShimerLodingForCo()
                    : MainButton(
                        chil: "حفظ التغييرات",
                        colo: AppColors.secondaryClr,
                        function: () {
                          if (controller.editProfileKey.currentState!
                              .validate()) {
                            controller.editProfileDetailse();
                          }
                        });
              })
            ],
          ),
        ),
      ),
    ));
  }
}

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.controller,
  });

  final EditProfileScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "اختر النوع",
          style: AppStyle.normalw,
        ),
        SizedBox(
          width: 40,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryClr2),
            child: DropdownButtonFormField(
                value: controller.gender,
                style: TextStyle(color: AppColors.whiteClr),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return value == null ? 'يجب اختيار النوع' : null;
                },
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                iconSize: 35,
                dropdownColor: AppColors.primaryClr2,
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: InputDecoration(
                    errorStyle: AppStyle.smallw, border: InputBorder.none),
                items: List.generate(
                    genderlist.length,
                    (index) => DropdownMenuItem<String>(
                        value: genderlist[index]["gender"],
                        child: Text(genderlist[index]["text"]))),
                onChanged: (String? v) {
                  controller.changgender(v);
                  print(v);
                  // controller.changeCatId(v!);
                }),
          ),
        ),
      ],
    );
  }
}

class TakeImageWidget extends StatelessWidget {
  const TakeImageWidget({
    super.key,
    required this.controller,
  });

  final EditProfileScreenController controller;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: IconButton(
          onPressed: () async {
            Get.bottomSheet(Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(gradient: AppStyle.linearGradient),
                height: 200,
                // color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "صورة الملف الشخصي",
                      style: AppStyle.normalw,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.takephotoFromCamera();
                                Get.back();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.white)),
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
                                controller.takephotoFromGalary();
                                Get.back();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.white)),
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
    );
  }
}

List<Map> genderlist = [
  {"gender": "1", "text": "ذكر"},
  {"gender": "2", "text": "انثى"}
];

class FormForEditCountry extends StatelessWidget {
  final Function(String?) onchang;
  final String? edicountry;

  FormForEditCountry({
    Key? key,
    required this.onchang,
    this.edicountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: DropdownButtonFormField(
          value: edicountry,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          // isExpanded: true,
          dropdownColor: AppColors.primaryClr2,
          style: AppStyle.normalw,
          borderRadius: BorderRadius.circular(15),
          decoration: InputDecoration(
            errorStyle: AppStyle.smallw,
            hintText: "choose your cuntry",
            hintStyle: AppStyle.smallg,
            prefixIcon: Icon(
              Icons.flag,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: InputBorder.none,
            filled: true,
            fillColor: AppColors.primaryClr2,
            // fillColor: AppColors.primaryLight,
          ),
          // value: "syria",
          items: [
            DropdownMenuItem<String>(
              value: "syria",
              child: Text("syria"),
            ),
            DropdownMenuItem(
              value: "Turkish",
              child: Text("Turkish"),
            ),
            DropdownMenuItem(
              value: "irak",
              child: Text("irak"),
            ),
          ],
          onChanged: (String? value) {
            onchang(value);
          }),
    );
  }
}
