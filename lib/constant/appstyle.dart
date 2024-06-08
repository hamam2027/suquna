import 'package:flutter/material.dart';
import 'package:suquna/constant/appcolor.dart';

class AppStyle {
  static const TextStyle normal =
      TextStyle(color: AppColors.secondaryClr, fontSize: 16);

  static const linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.primaryClr, AppColors.primaryDark]);
}
