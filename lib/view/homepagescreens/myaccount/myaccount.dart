import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/accountscreencontroller.dart';

class AccountScreen extends GetView<AccountScreenController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Text(
                " الملف الشخصي",
                style: AppStyle.normal,
              ),
              Spacer(),
              Text(
                "تعديل الملف الشخصي",
                style: AppStyle.normal,
              ),
              Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ],
          ),
        ),
        body: Container(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hamam Gaber"),
                          Text("Syria"),
                          Row(
                            children: [
                              Text("متصل"),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.green,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                            3,
                            (index) => MaterialButton(
                                  color: AppColors.whiteClr,
                                  onPressed: () {},
                                  child: Text("اعلاناتي"),
                                ))
                      ])
                ],
              )),
        ),
      ),
    );
  }
}
