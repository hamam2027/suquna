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
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      "Create new account".tr,
                      style: AppStyle.largw,
                    ),
                    Spacer(),
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
                      hint: "",
                      controller: controller.phonecontroller,
                      type: TextInputType.phone,
                      focusNode: controller.phonfocus,
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
                    Spacer(),
                    MainButton(
                      chil: "Create an account".tr,
                      colo: AppColors.secondaryClr,
                      function: () {},
                    ),
                    Spacer(),
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
    );
  }
}
