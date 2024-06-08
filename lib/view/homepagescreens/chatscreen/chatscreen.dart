import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/chatscreencontroller.dart';

class ChatScreen extends GetView<ChatScreenController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 5,
                indicatorColor: AppColors.secondaryClr,
                // dividerHeight: 10,
                tabs: [
                  Tab(
                      child: Text(
                    controller.text,
                    style: AppStyle.normal,
                  )),
                  Tab(
                      child: Text(
                    "Buying",
                    style: AppStyle.normal,
                  )),
                  Tab(
                      child: Text(
                    "Selling",
                    style: AppStyle.normal,
                  )),
                ]),
          ),
          body: TabBarView(
              children: List.generate(
                  3,
                  (index) => Container(
                        child: ListView(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Container(
                                margin: EdgeInsets.all(5),
                                color: AppColors.whiteClr,
                                height: 80,
                                child: Center(
                                  child: ListTile(
                                    onTap: () {},
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
                      ))),
        ));
  }
}
