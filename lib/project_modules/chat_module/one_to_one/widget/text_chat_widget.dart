import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';

class TextChatWidget extends StatelessWidget {
  const TextChatWidget({super.key, this.message, this.userId});
  final dynamic message;
  final dynamic userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
      child: SmallText(text: "$message",color: "$userId"=="${userInfo?.userId}"?Colors.white: Colors.black,fontWeight: FontWeight.w400,size: 16,),
    );
  }
}
