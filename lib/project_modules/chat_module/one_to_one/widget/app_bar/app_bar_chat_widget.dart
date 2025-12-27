import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/project_modules/chat_module/one_to_one/controller_one_to_one.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../forward/forward_screen.dart';

class AppBarChatWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarChatWidget({super.key, this.title});
  final dynamic title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerOneToOne(),
      builder: (controller) {
        return WillPopScope(onWillPop: () async{
          controller.selectedIndexList.clear();
          controller.update();
          return false;
        },
          child: AppBarCommon(centerTitle: false,title: "$title",actions: [
            if(controller.selectedIndexList.length==1)IconButton(onPressed: (){}, icon: ImageCommon( AppImages.reply,color: Colors.white,size: 24,)),
            IconButton(onPressed: (){
              controller.deleteMessage();
            }, icon: ImageCommon( AppImages.delete,color: Colors.white,size: 24,)),
            IconButton(onPressed: (){
              Get.to(()=>ForwardScreen());
            }, icon: ImageCommon( AppImages.forward,color: Colors.white,size: 24,)),
            IconButton(onPressed: (){
             controller.copyData();
            }, icon: ImageCommon( AppImages.copy,color: Colors.white,size: 24,)),

          ],),
        );
      }
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
