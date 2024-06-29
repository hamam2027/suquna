import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/componant/formvalidator.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/authcontollers/signincontroller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      FocusScope.of(context).unfocus();
    }

    Size divsize = MediaQuery.of(context).size;
    return GetBuilder<SignInController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.emailfocus.unfocus();
          controller.passwordfocus.unfocus();
        },
        child: Container(
          height: divsize.height,
          decoration: BoxDecoration(gradient: AppStyle.linearGradient),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.grayClr),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              height: 30,
                              color: controller.local == Locale("ar_EG")
                                  ? AppColors.secondaryClr
                                  : null,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                controller.changlangarco();
                              },
                              child: Text(
                                "العربية",
                                style: AppStyle.smallw,
                              ),
                            ),
                            MaterialButton(
                              height: 30,
                              color: controller.local == Locale("en_US")
                                  ? AppColors.secondaryClr
                                  : null,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                controller.changlangenco();
                              },
                              child: Text(
                                "English",
                                style: AppStyle.smallw,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: divsize.height / 20,
                      ),
                      Text(
                        "Login".tr,
                        style: AppStyle.largw,
                      ),
                      SizedBox(
                        height: divsize.height / 20,
                      ),
                      Form(
                          key: controller.formkey,
                          child: Column(
                            children: [
                              MainformField(
                                preicon: Icons.person,
                                hint: "Email".tr,
                                controller: controller.emailcontroller,
                                type: TextInputType.emailAddress,
                                validator: (value) {
                                  return MainFormValidator.emailValidator(
                                      value);
                                },
                                focusNode: controller.emailfocus,
                              ),
                              MainformField(
                                preicon: Icons.lock_outline,
                                hint: "Password".tr,
                                controller: controller.passwordcontroller,
                                type: TextInputType.text,
                                validator: (value) {
                                  // return null;

                                  return MainFormValidator.passwordValidator(
                                      value);
                                },
                                focusNode: controller.passwordfocus,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: divsize.height / 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(
                            AppRouter.forgetpassword,
                          );
                        },
                        child: Text(
                          'Forgot password'.tr,
                          style: AppStyle.normalo,
                        ),
                      ),
                      SizedBox(
                        height: divsize.height / 20,
                      ),
                      controller.isloding
                          ? Center(
                              child: CircularProgressIndicator(
                              color: AppColors.secondaryClr,
                            ))
                          : MainButton(
                              chil: "Login".tr,
                              colo: AppColors.secondaryClr,
                              function: () async {
                                _hideKeyboard();
                                print("111");
                                if (controller.formkey.currentState!
                                    .validate()) {
                                  await controller.loginWithdio();
                                }
                              },
                            ),
                      MainButton(
                        chil: "Continue as guest".tr,
                        colo: AppColors.whiteClr,
                        function: () {
                          Get.offNamed(AppRouter.home);
                        },
                      ),
                      SizedBox(
                        height: divsize.height / 20,
                      ),
                      Text(
                        "Or".tr,
                        style: AppStyle.largw,
                      ),
                      SizedBox(
                        height: divsize.height / 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(
                            AppRouter.signupscreen,
                          );
                        },
                        child: Text(
                          'Create new account'.tr,
                          style: AppStyle.normalo,
                        ),
                      ),
                      SizedBox(
                        height: divsize.height / 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
