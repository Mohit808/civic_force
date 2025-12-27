import 'package:civic_force/project_modules/chat_module/one_to_one/controller_one_to_one.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmojiChatWidget extends StatelessWidget {
  const EmojiChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerOneToOne(),builder: (controller){
      return !controller.isEmojiShowing?SizedBox():EmojiPicker(
        onEmojiSelected: (category, emoji) {
          controller.update();
        },
        onBackspacePressed: () {
        },
        textEditingController: controller.textEditingController,
        config: Config(
            height: 256,
            // emojiTextStyle: TextStyle(color: Colors.white),
            // bgColor: const Color(0xFFF2F2F2),
            checkPlatformCompatibility: true,
            emojiViewConfig: EmojiViewConfig(
              // backgroundColor: Colors.black,
              emojiSizeMax: 28 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ?  1.20 :  1.0),
            ),
            viewOrderConfig: const ViewOrderConfig(
              top: EmojiPickerItem.categoryBar,
              middle: EmojiPickerItem.emojiView,

            ),
            // skinToneConfig: const SkinToneConfig(dialogBackgroundColor: Colors.black),
            // categoryViewConfig: const CategoryViewConfig(backgroundColor: Colors.black),
            // bottomActionBarConfig: const BottomActionBarConfig(),
            // searchViewConfig: const SearchViewConfig(backgroundColor: Colors.white70),
            bottomActionBarConfig: BottomActionBarConfig(enabled: false,backgroundColor: Colors.white70)
        ),
      );
    });
  }
}
