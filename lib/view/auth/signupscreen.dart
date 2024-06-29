import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/authcontollers/signupcontroller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});
  final bool isco = false;

  @override
  Widget build(BuildContext context) {
    Size divsize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        controller.emailfocus.unfocus();
        controller.passwordfocus.unfocus();
        controller.usernamefocus.unfocus();
        controller.conpasswordfocus.unfocus();
        controller.phonfocus.unfocus();
      },
      child: Container(
        decoration: BoxDecoration(gradient: AppStyle.linearGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: divsize.height * 0.04,
                      ),
                      Text(
                        "Create new account".tr,
                        style: AppStyle.largw,
                      ),
                      SizedBox(
                        height: divsize.height * 0.02,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              clipBehavior: Clip.antiAlias,
                              height: divsize.height * 0.15,
                              width: divsize.height * 0.15,
                              child: controller.imagefile != null
                                  ? Image.file(
                                      controller.imagefile!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/images/placeholder.png",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          MaterialButton(
                              padding: EdgeInsets.all(5),
                              minWidth: 0,
                              shape: CircleBorder(),
                              color: AppColors.blackClr,
                              onPressed: () {
                                Get.bottomSheet(Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
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
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          border: Border
                                                              .fromBorderSide(
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Icon(
                                                        Icons
                                                            .camera_alt_outlined,
                                                        size: 40,
                                                        color:
                                                            AppColors.whiteClr,
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
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          border: Border
                                                              .fromBorderSide(
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Icon(
                                                        Icons.image,
                                                        size: 40,
                                                        color:
                                                            AppColors.whiteClr,
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
                              },
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: divsize.height * 0.02,
                      ),
                      MainformField(
                        preicon: Icons.person,
                        hint: "Username".tr,
                        controller: controller.usernamecontroller,
                        type: TextInputType.text,
                        focusNode: controller.usernamefocus,
                      ),
                      MainformField(
                        preicon: Icons.email,
                        hint: "Email".tr,
                        controller: controller.emailcontroller,
                        type: TextInputType.emailAddress,
                        focusNode: controller.emailfocus,
                      ),
                      MainformField(
                        preicon: Icons.phone,
                        hint: "رقم الهاتف",
                        controller: controller.phonecontroller,
                        type: TextInputType.phone,
                        focusNode: controller.phonfocus,
                      ),
                      FormForCuntry(),
                      FormForDate(
                        controller: controller.datecontroller,
                        calendericon: Icons.calendar_month,
                        datepic: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(1990),
                            firstDate: DateTime(1940),
                            lastDate: DateTime(2010),
                          );
                          if (selectedDate != null) {
                            controller.datecontroller.text =
                                "${selectedDate.toLocal()}".split(' ')[0];
                          }
                        },
                      ),
                      MainformField(
                        preicon: Icons.lock_outline,
                        hint: "Password".tr,
                        controller: controller.passwordcontroller,
                        type: TextInputType.text,
                        focusNode: controller.passwordfocus,
                      ),
                      MainformField(
                        preicon: Icons.lock_outline,
                        hint: "Confirm password".tr,
                        controller: controller.conpasswordcontroller,
                        type: TextInputType.text,
                        focusNode: controller.conpasswordfocus,
                      ),
                      SizedBox(
                        height: divsize.height * 0.02,
                      ),
                      SizedBox(
                        height: divsize.height * 0.02,
                      ),
                      MainButton(
                        chil: "Create an account".tr,
                        colo: AppColors.secondaryClr,
                        function: () {
                          if (controller.formkey.currentState!.validate()) {
                            controller.signUpUser();
                          }
                        },
                      ),
                      SizedBox(
                        height: divsize.height * 0.02,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.offNamed(AppRouter.signinscreen);
                          },
                          child: Text(
                            "I already have an account".tr,
                            style: AppStyle.normalo,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
