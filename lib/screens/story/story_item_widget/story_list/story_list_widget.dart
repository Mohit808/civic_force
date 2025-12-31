import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/model/story_model.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widget/text_common.dart';
import '../story_full_screen_app_bar.dart';
import 'controller_story_list.dart';

class StoryListWidget extends StatelessWidget {
  const StoryListWidget({super.key,this.list});
  final List<Stories>? list;

  @override
  Widget build(BuildContext context) {

    return GetBuilder(init: ControllerStoryList(list: list),
      builder: (controller) {
        return PageView.builder(controller: controller.pageController,onPageChanged: (value){
          controller.selectedIndex=value;
          controller.startProgressTimer();
          controller.update();
        },physics: controller.selectedIndex==list!.length-1?NeverScrollableScrollPhysics():null,pageSnapping: true,scrollDirection: Axis.horizontal,itemCount: list!.length,itemBuilder: (itemBuilder,index){
          return Stack(
            children: [
              Center(child: InkWell(onTap: (){
                // controller.nextStory();
              },child: Image.network("${list![index].mediaUrl}",errorBuilder: (a,b,c)=>Image.asset(AppImages.user),))),
              Positioned(bottom: 36,left: 0,right: 0,
                child: Column(
                  children: [
                    if(list![index].text!=null && "${list![index].text}".isNotEmpty)Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SmallText(text: "${list![index].text}",color: Colors.white,textAlign: TextAlign.center,),
                    ),
                    Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,spacing: 8,
                      children: [
                        Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                        SmallText(text: "${list![index].viewCount??'0'}",color: Colors.white,size: 16,fontWeight: FontWeight.w600,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      }
    );
  }
}
