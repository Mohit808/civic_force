import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';
import 'controller_mutual_contact.dart';

class ContactMutualScreen extends StatelessWidget {
  const ContactMutualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMutualContact(),
      builder: (controller) {
      print(token);
        return
          controller.list.isEmpty?SizedBox():
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          SmallText(text: "Mutual Contacts",fontWeight: FontWeight.w600,color: Colors.black54,size: 15,),
          SizedBox(height: 16,),
          ListView.separated(padding: EdgeInsets.only(bottom: 24),shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
            return Row(spacing: 16,children: [
              ImageCommon("${controller.list[index].image}",sizeAndCircle: 45,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
                SmallText(text: "${controller.list[index].name}",fontWeight: FontWeight.w600,size: 15,),
                SmallText(text: "Mutual friend of Suraj",color: Colors.black54,)
              ],)

            ]);
          }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },)
        ],);
      }
    );
  }
}
