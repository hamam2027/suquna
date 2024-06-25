import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conpasswordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();
  FocusNode usernamefocus = FocusNode();
  FocusNode conpasswordfocus = FocusNode();
  FocusNode phonfocus = FocusNode();
}
