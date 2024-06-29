import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/sellscreencontroller.dart';

class SellScreen extends StatelessWidget {
  SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SellScreenController controller = Get.find();
    Size devsiz = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("اعلان جديد"),
      ),
      body: GestureDetector(
        onTap: () {
          controller.namefucas.unfocus();

          controller.pricefucas.unfocus();
          controller.descfucas.unfocus();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<SellScreenController>(builder: (controller) {
                  return controller.selectList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Form(
                          key: controller.formkey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "اختر الفئة",
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.primaryClr2),
                                      child: DropdownButtonFormField(
                                          style: TextStyle(
                                              color: AppColors.whiteClr),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) {
                                            return value == null
                                                ? 'يجب اختيار احد الاقسام'
                                                : null;
                                          },
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                          ),
                                          iconSize: 35,
                                          dropdownColor: AppColors.primaryClr2,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: InputDecoration(
                                              errorStyle: AppStyle.smallw,
                                              border: InputBorder.none),
                                          items: List.generate(
                                              controller.selectList.length,
                                              (index) => DropdownMenuItem(
                                                  value: controller
                                                      .selectList[index].id,
                                                  child: Text(controller
                                                      .selectList[index]
                                                      .name!))),
                                          onChanged: (v) {
                                            controller.changeCatId(v!);
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: devsiz.height / 20,
                              ),
                              MainformField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  } else {
                                    return null;
                                  }
                                },
                                preicon: Icons.store,
                                hint: "اسم المنتج",
                                controller: controller.nameController,
                                type: TextInputType.text,
                                focusNode: controller.namefucas,
                              ),
                              MainformField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  } else {
                                    return null;
                                  }
                                },
                                preicon: Icons.price_check_outlined,
                                hint: "سعر",
                                controller: controller.priceController,
                                type: TextInputType.number,
                                focusNode: controller.pricefucas,
                              ),
                              // MainformField(
                              //   preicon: Icons.location_on,
                              //   hint: "سوريا / الرقة",
                              //   controller: controller.advcontroller,
                              //   type: TextInputType.text,
                              //   focusNode: advfucas,
                              // ),
                              MainformField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  } else {
                                    return null;
                                  }
                                },
                                maxLin: 7,
                                // preicon: Icons.location_on,
                                hint: "وصف المنتج",
                                controller: controller.descriptionController,
                                type: TextInputType.text,
                                focusNode: controller.descfucas,
                              ),
                            ],
                          ));
                }),

                // للصور
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
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                                    controller.imagesFile
                                                        .remove(controller
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
                    function: () {
                      if (controller.formkey.currentState!.validate()) {
                        controller.addProdactFromSell();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
