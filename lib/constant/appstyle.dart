import 'package:flutter/material.dart';
import 'package:suquna/constant/appcolor.dart';

class AppStyle {
  //white styls
  static const TextStyle smallw = TextStyle(
    color: AppColors.whiteClr,
    fontSize: 14,
    fontFamily: "Poppins-Medium",
  );
  static const TextStyle normalw = TextStyle(
    color: AppColors.whiteClr,
    fontSize: 16,
  );

  static const TextStyle largw = TextStyle(
    color: AppColors.whiteClr,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle largwb = TextStyle(
    color: AppColors.whiteClr,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  //orang styls
  static const TextStyle smallo = TextStyle(
    color: AppColors.dangerClr,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle normalo = TextStyle(
    color: AppColors.dangerClr,
    fontSize: 16,
  );

  static const TextStyle largo = TextStyle(
    color: AppColors.dangerClr,
    fontSize: 20,
  );
  static const TextStyle largob = TextStyle(
    color: AppColors.dangerClr,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

// black styls
  static const TextStyle smallb = TextStyle(
    color: AppColors.blackClr,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle normalb = TextStyle(
    color: AppColors.blackClr,
    fontSize: 16,
  );

  static const TextStyle largb = TextStyle(
    color: AppColors.blackClr,
    fontSize: 20,
  );
  static const TextStyle largbb = TextStyle(
    color: AppColors.blackClr,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
// grey styls
  static const TextStyle smallg = TextStyle(
    color: AppColors.grayClr,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle normalg = TextStyle(
    color: AppColors.grayClr,
    fontSize: 16,
  );

  static const TextStyle largg = TextStyle(
    color: AppColors.grayClr,
    fontSize: 20,
  );
  static const TextStyle larggb = TextStyle(
    color: AppColors.grayClr,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryClr, AppColors.primaryDark],
  );
}
