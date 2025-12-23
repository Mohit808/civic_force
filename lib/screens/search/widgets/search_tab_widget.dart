import 'package:civic_force/screens/search/controller_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/text_common.dart';

class SearchTabWidget extends StatelessWidget {
  const SearchTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSearch(),
      builder: (controller) {
        return Column(children: [
          Row(spacing: 24,children: [
            Expanded(
              child: InkWell(onTap: (){
                controller.changeTab(0);
              },
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
                  children: [
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Expanded(child: SmallText(text: "For you",fontWeight: FontWeight.w600,size: 16,color: controller.selectedTab==0?Colors.black:Colors.black54,textAlign: TextAlign.center,)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: ContainerDecorated(color: controller.selectedTab==0? Colors.black:Colors.transparent,height: 4,)),
                      ],
                    )
                  ],
                ),
              ),
            ),Expanded(
              child: InkWell(onTap: (){
                controller.changeTab(1);
              },
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
                  children: [
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Expanded(child: SmallText(text: "Accounts",size: 16,color: controller.selectedTab==1?Colors.black:Colors.black54,textAlign: TextAlign.center,)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: ContainerDecorated(color: controller.selectedTab==1? Colors.black:Colors.transparent,height: 4)),
                      ],
                    )
                  ],
                ),
              ),
            ),Expanded(
              child: InkWell(onTap: (){
                controller.changeTab(2);
              },
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
                  children: [
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Expanded(child: SmallText(text: "Tags",size: 16,color: controller.selectedTab==2?Colors.black:Colors.black54,textAlign: TextAlign.center,)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: ContainerDecorated(color: controller.selectedTab==2? Colors.black:Colors.transparent,height: 4)),
                      ],
                    )
                  ],
                ),
              ),
            ),Expanded(
              child: InkWell(onTap: (){
                controller.changeTab(3);
              },
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
                  children: [
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Expanded(child: SmallText(text: "Places",size: 16,color: controller.selectedTab==3?Colors.black:Colors.black54,textAlign: TextAlign.center,)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: ContainerDecorated(color:controller.selectedTab==3? Colors.black:Colors.transparent,height: 4)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],),
          Divider(height: 1,),
        ],);
      }
    );
  }
}
