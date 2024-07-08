import 'package:get/get.dart';

class MainFormValidator {
  static RegExp strongPassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  static RegExp emailreqwirment = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // ^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$
  // general validator
  static validator(String value, String message) {
    if (value.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  static phoneValidator(String value) {
    if (value.isEmpty) {
      return 'this field is required'.tr;
    } else if (value.length != 11) {
      return "phone number is not valid";
    } else {
      return null;
    }
  }
  // password validator

//   Minimum 1 Upper case
// Minimum 1 lowercase
// Minimum 1 Numeric Number
// Minimum 1 Special Character
// Common Allow Character ( ! @ # $ & * ~ )
  static passwordValidator(String value) {
    if (value.isEmpty) {
      return 'this field is required'.tr;
    } else if (!strongPassword.hasMatch(value)) {
      return "password is not strong enough";
    } else {
      return null;
    }
  }

  static confirmPasswordValidator(String value, String value2) {
    if (value.isEmpty) {
      return "Re-enter password";
    } else if (value != value2) {
      return "passwords dont match";
    } else {
      return null;
    }
  }

  static emailValidator(String value) {
    if (value.isEmpty) {
      return 'this field is required'.tr;
    } else if (!emailreqwirment.hasMatch(value)) {
      return "email is not valid";
    } else {
      return null;
    }
  }
}
