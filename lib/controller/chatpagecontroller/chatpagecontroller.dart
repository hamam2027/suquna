import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPageScreenController extends GetxController {
  bool showEmojiPicker = false;
  TextEditingController messagecontroller = TextEditingController();
  @override
  void onEmojiSelected(Emoji emoji) {
    messagecontroller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messagecontroller.text.length));
  }

  void onBackspacePressed() {
    messagecontroller
      ..text = messagecontroller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messagecontroller.text.length));
  }
}
