import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';
import '../controller_contacts.dart';

class ContactInviteScreen extends StatelessWidget {
  const ContactInviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerContacts(),
      builder: (controller) {
        return
          controller.listInvite.isEmpty?SizedBox():
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          SmallText(text: "Invite Contacts",fontWeight: FontWeight.w600,color: Colors.black54,size: 15,),
          SizedBox(height: 16,),
          ListView.separated(padding: EdgeInsets.only(bottom: 24),itemCount: controller.listInvite.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (itemBuilder,index){
            return Row(spacing: 16,children: [
              ImageCommon(controller.listInvite[index].registeredImage,sizeAndCircle: 45,),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
                children: [
                  SmallText(text: controller.listInvite[index].name,fontWeight: FontWeight.w600,size: 15,maxLine: 1,),
                  SmallText(text: '${controller.listInvite[index].number}',color: Colors.black54,)
                ],
              )),
              Row(spacing: 8,
                children: [
                  Icon(Icons.add,size: 16,color: Colors.green,),
                  SmallText(text: "Invite",color: Colors.green,fontWeight: FontWeight.w500,),

                ],
              )
            ],);
          }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },),


        ],);
      }
    );
  }
}
