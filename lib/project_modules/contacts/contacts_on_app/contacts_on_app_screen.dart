import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';
import '../controller_contacts.dart';

class ContactsOnAppScreen extends StatelessWidget {
  const ContactsOnAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerContacts(),
      builder: (controller) {
        return  controller.list.isEmpty?SizedBox(): Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(text: "Contacts on app",fontWeight: FontWeight.w600,color: Colors.black54,size: 15,),
            SizedBox(height: 16,),
            ListView.separated(padding: EdgeInsets.only(bottom: 24),itemCount: controller.list.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (itemBuilder,index){
              return InkWell(onTap: (){
                Get.to(()=>UserProfileScreen(userId: controller.list[index].registeredUserId,name: controller.list[index].registeredName,image: controller.list[index].registeredImage,));
              },
                child: Row(spacing: 16,children: [
                  ImageCommon(controller.list[index].registeredImage,sizeAndCircle: 45,),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
                    children: [
                      SmallText(text: controller.list[index].registeredName,fontWeight: FontWeight.w600,size: 15,maxLine: 1,),
                      SmallText(text: '${controller.list[index].number}',color: Colors.black54,)

                    ],
                  )),
                ],),
              );
            }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },),
          ],
        );
      }
    );
  }
}
