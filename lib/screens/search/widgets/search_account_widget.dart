import 'package:civic_force/data_source/data_source_common.dart';
import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';
import '../controller_search.dart';

class SearchAccountWidget extends StatelessWidget {
  const SearchAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSearch(),
      builder: (controller) {
        return Column(spacing: 24,crossAxisAlignment: CrossAxisAlignment.start,children: [
          if(controller.selectedTab==0)SmallText(text: "Accounts",fontWeight: FontWeight.w600,size: 18,),
          ListView.separated(physics: NeverScrollableScrollPhysics(),itemCount: controller.listAccounts.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
            return InkWell(onTap: (){
              Get.to(()=>UserProfileScreen(userId: controller.listAccounts[index].userId,name: controller.listAccounts[index].name,image: controller.listAccounts[index].image,));
            },
              child: Row(spacing: 24,children: [
                ImageCommon( "${controller.listAccounts[index].image}",height: 50,width: 50,borderRadius: 50,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
                  Row(spacing: 8,
                    children: [
                      SmallText(text: "${controller.listAccounts[index].name}",fontWeight: FontWeight.w500,size: 16,),
                      Icon(Icons.check_circle,color: Colors.blue,size: 16,)
                    ],
                  ),
                  Row(spacing: 8,
                    children: [
                      SmallText(text: "amit.ayx.360",color: Colors.black54,),
                      ContainerDecorated(color: Colors.black26,),
                      SmallText(text: "${controller.listAccounts[index].followersCount} followers",color: Colors.black54,)
                    ],
                  )
                ],)
              ],),
            );
          }, separatorBuilder: (BuildContext context, int index) { return Divider(); },),
        ],);
      }
    );
  }
}
