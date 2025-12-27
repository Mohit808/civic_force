import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widget/text_common.dart';

class DeleteMessageDialog extends StatelessWidget {
  const DeleteMessageDialog({super.key, this.onTap, this.isDeleteChat});
  final Function()? onTap;
  final bool? isDeleteChat;

  @override
  Widget build(BuildContext context) {
    return Dialog(backgroundColor: Color(0xFF151A16),child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,children: [
        SmallText(text: isDeleteChat==true?"Delete Chat": "Delete Message",color: Colors.white70,size: 16,fontWeight: FontWeight.w500,),
        SizedBox(height: 36,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
          InkWell(onTap: (){
            Get.back();
          },child: SmallText(text: "Cancel",color: Colors.green,)),
          InkWell(onTap: (){
            Get.back();
            if(onTap!=null)onTap!();
          },child: SmallText(text: isDeleteChat==true?"Delete Chat": "Delete for everyone",color: Colors.green,)),
        ],)
      ],),
    ),);
  }
}
