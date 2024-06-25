import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/chatscreencontroller.dart';

class ChatScreen extends GetView<ChatScreenController> {
  ChatScreen({super.key});
  ChatScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Chats'.tr,
            style: AppStyle.largob,
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              ...List.generate(
                5,
                (index) => Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primaryClr2,
                  ),
                  height: 80,
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppRouter.chatPagecreen);
                      },
                      title: Text("folan elfolany"),
                      subtitle: Text("folan elfolany"),
                      enabled: true,
                      leading: CircleAvatar(
                        radius: 35,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
