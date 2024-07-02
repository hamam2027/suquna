// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/authcontollers/signupcontroller.dart';
import 'package:shimmer/shimmer.dart';

// Map<String, String> {"Authorization": "Bearer $token"} = {"Authorization": "Bearer $token"};
String subtractDates(String dateString) {
  DateTime currentDate = DateTime.now();
  DateTime parsedDate = DateTime.parse(dateString);

  Duration difference = currentDate.difference(parsedDate);

  int daysDifference = difference.inDays;
  int hoursDifference = difference.inHours % 24;
  int minutesDifference = difference.inMinutes % 60;

  return '$daysDifference يوماً $hoursDifference ساعات $minutesDifference دقائق';
}

int subtractDatesForyear(String dateString) {
  DateTime currentDate = DateTime.now();
  DateTime parsedDate = DateTime.parse(dateString);

  Duration difference = currentDate.difference(parsedDate);

  // int daysDifference = difference.inDays;
  // int hoursDifference = difference.inHours % 24;
  // int minutesDifference = difference.inMinutes % 60;
  int yeers = difference.inDays % 365;

  return yeers;
}

class MainformField extends StatelessWidget {
  const MainformField({
    Key? key,
    this.preicon,
    this.hint,
    this.controller,
    this.type,
    this.validator,
    this.focusNode,
    this.maxLin,
  }) : super(key: key);
  final IconData? preicon;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? type;
  final FormFieldValidator? validator;
  final FocusNode? focusNode;
  final int? maxLin;
  // final Function valed ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        autofocus: false,
        maxLines: maxLin ?? null,
        focusNode: focusNode ?? null,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller ?? null,
        keyboardType: type ?? null,
        style: AppStyle.normalw.copyWith(decoration: TextDecoration.none),
        decoration: InputDecoration(
          errorStyle: AppStyle.smallw,
          hintText: hint,
          hintStyle: AppStyle.smallg,
          prefixIcon: Icon(
            preicon,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
          filled: true,
          fillColor: AppColors.primaryClr2,
          // fillColor: AppColors.primaryLight,
        ),
      ),
    );
  }
}

class MyMainContainer extends StatelessWidget {
  final Widget child;
  const MyMainContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppStyle.linearGradient),
      child: child,
    );
  }
}

class FormForDate extends StatelessWidget {
  final IconData? calendericon;
  final Function? datepic;
  final TextEditingController? controller;
  const FormForDate({
    Key? key,
    this.calendericon,
    this.datepic,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return "هذا الحقل مطلوب";
            } else {
              return null;
            }
          },
          style: AppStyle.normalw,
          controller: controller,
          readOnly: true,
          onTap: () {
            datepic!();
          },
          decoration: InputDecoration(
            errorStyle: AppStyle.smallw,
            hintText: "enter your birth day",
            hintStyle: AppStyle.smallb,

            prefixIcon: Icon(
              calendericon,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: InputBorder.none,
            filled: true,
            fillColor: AppColors.primaryClr2,
            // fillColor: AppColors.primaryLight,
          ),
        ));
  }
}

class FormForCuntry extends StatelessWidget {
  final SignUpController controller = Get.find();
  // GetxController controller;

  FormForCuntry({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return "هذا الحقل مطلوب";
            } else {
              return null;
            }
          },
          isExpanded: true,
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
          onChanged: (v) {
            controller.cuntry = v;
            print(controller.cuntry);
            controller.update();
          }),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.chil,
    required this.colo,
    required this.function,
    this.minWidth,
    this.styll,
  }) : super(key: key);
  final String chil;
  final Color colo;
  final Function function;
  final double? minWidth;
  final TextStyle? styll;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        height: 50,
        minWidth: minWidth ?? double.infinity,
        color: colo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          function();
        },
        child: Text(
          chil,
          style: styll,
        ),
      ),
    );
  }
}

class ShimerLodingForCo extends StatelessWidget {
  const ShimerLodingForCo({
    super.key,
    this.width,
  });
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        height: 40,
        width: width ?? double.infinity,
        margin: EdgeInsets.all(10),
      ),
      baseColor: AppColors.primaryClr,
      highlightColor: AppColors.secondaryClr,
    );
  }
}
