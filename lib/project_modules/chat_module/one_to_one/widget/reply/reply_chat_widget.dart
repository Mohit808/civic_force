import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';

class ReplyChatWidget extends StatelessWidget {
  const ReplyChatWidget({super.key, this.userId, this.name, this.text});
  final dynamic userId;
  final dynamic name;
  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min,
      children: [
        Container(decoration: BoxDecoration(color: Color(0xFFBD95D8),borderRadius: BorderRadius.circular(10)),
          child: Container(constraints: BoxConstraints(minWidth: 100),margin: EdgeInsets.only(left: 6),padding: EdgeInsets.all(8),decoration: BoxDecoration(color: Color(0xFF353845),borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),child: Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,children: [
            SmallText(text: "$name",color: Color(0xFFBD95D8),fontWeight: FontWeight.w600,),
            SmallText(text: "$text",color: Colors.white70,fontWeight: FontWeight.w500,)
          ],),),
        ),
      ],
    );
  }
}
