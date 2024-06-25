import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/chatpagecontroller/chatpagecontroller.dart';

class ChatPageScreen extends GetView<ChatPageScreenController> {
  ChatPageScreen({super.key});

  Widget build(BuildContext context) {
    return GetBuilder<ChatPageScreenController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(gradient: AppStyle.linearGradient),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "المحادثات",
              style: AppStyle.largo,
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Align(
                        alignment: index.isEven
                            ? AlignmentDirectional.centerEnd
                            : AlignmentDirectional.centerStart,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: index.isEven
                                    ? Radius.circular(15)
                                    : Radius.circular(0),
                                bottomLeft: index.isEven
                                    ? Radius.circular(0)
                                    : Radius.circular(15),
                              ),
                              color: index.isEven
                                  ? AppColors.whiteClr
                                  : AppColors.infoClr),
                          child: Text("hello from hamam"),
                        ),
                      );
                    },
                  ),
                ),
                controller.showEmojiPicker
                    ? Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: EmojiPicker(
                          onEmojiSelected: (category, emoji) {
                            controller.onEmojiSelected(emoji);
                          },
                          onBackspacePressed: controller.onBackspacePressed,
                          config: Config(
                            height: 200,
                            // bgColor: const Color(0xFFF2F2F2),
                            checkPlatformCompatibility: true,
                            emojiViewConfig: EmojiViewConfig(
                              // Issue: https://github.com/flutter/flutter/issues/28894
                              emojiSizeMax: 28 *
                                  (foundation.defaultTargetPlatform ==
                                          TargetPlatform.iOS
                                      ? 1.20
                                      : 1.0),
                            ),
                            swapCategoryAndBottomBar: false,

                            skinToneConfig:
                                const SkinToneConfig(enabled: false),
                            categoryViewConfig: const CategoryViewConfig(),
                            bottomActionBarConfig:
                                const BottomActionBarConfig(enabled: false),
                            searchViewConfig: const SearchViewConfig(),
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: AppColors.grayClr.withOpacity(0.5)),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.emoji_emotions,
                          color: AppColors.secondaryClr,
                        ),
                        onPressed: () {
                          controller.showEmojiPicker =
                              !controller.showEmojiPicker;
                          controller.update();
                          ;
                        },
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: controller.messagecontroller,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder()),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            print(controller.messagecontroller.text);
                          },
                          icon: Icon(
                            Icons.send,
                            size: 30,
                            color: AppColors.infoClr,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
