import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/project_modules/post/item_widget/post_item_widget.dart';
import 'package:civic_force/project_modules/post/post_main_list_widget.dart';
import 'package:civic_force/screens/search/controller_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';

class SearchPostWidget extends StatelessWidget {
  const SearchPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSearch(),
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SmallText(text: "Posts",size: 18,fontWeight: FontWeight.w600,),
          ),
          SizedBox(height: 16,),

          GridView.builder(itemCount: controller.listPosts.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (itemBuilder,index){
            return InkWell(onTap: (){
              showModalBottomSheet(showDragHandle: true,isScrollControlled: true,context: context, builder: (builder){
                return SingleChildScrollView(child: Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 24),
                  child: 
                  // PostMainListWidget(listReceived: controller.listPosts,),
                  PostItemWidget(data: controller.listPosts[index])
                ));
              });
            },child: Stack(
              children: [
                AspectRatio(aspectRatio: 1,child: ImageCommon( "${controller.listPosts[index].image}".split(",").first,borderRadius: 10,)),
                if(false)Positioned(bottom: 8,right: 4,left: 8,
                  child: Row(children: [
                    Icon(Icons.play_arrow_rounded,size: 16,color: Colors.white,),
                    SmallText(text: "33K",color: Colors.white,)
                  ],),
                ),
                if("${controller.listPosts[index].image}".split(",").length>1)Positioned(bottom: 8,right: 8,
                  child: Row(spacing: 4,children: [
                    for(var x in "${controller.listPosts[index].image}".split(","))
                      ContainerDecorated(color: Colors.white,height: 8,width: 8,)

                  ],),
                ),


              ],
            ));
          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 4,crossAxisSpacing: 4),)
        ],);
      }
    );
  }
}
