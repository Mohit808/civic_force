import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/model/story_model.dart';
import 'package:civic_force/project_modules/chat_module/chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_full_story.dart';

class FullStoryScreen extends StatelessWidget {
  const FullStoryScreen({super.key, required this.listGroupedStory});
  final List<GroupedStories> listGroupedStory;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerFullStory(listGroupedStory: listGroupedStory),
        builder: (controller) {
          return Scaffold(
            body: PageView.builder(controller: controller.pageController,itemCount: listGroupedStory.length,onPageChanged: (value){
              if( listGroupedStory[value].items!.length>1){
                controller.canScroll=true;
                controller.update();
              }
              controller.selectedIndex=0;
              controller.startProgressTimer();
            },itemBuilder: (itemBuilder,index){
              return Stack(
                children: [
                  GestureDetector(
                    onHorizontalDragStart: (details) {
                      controller.dragStart = details.globalPosition;
                    },
                    onHorizontalDragUpdate: (details) {
                      final delta = details.globalPosition.dx - controller.dragStart.dx;

                      if(!controller.canTriggerDrag()) return;
                      if (delta > 0) {
                        debugPrint("⬅️ Dragging BACKWARD");
                        if(controller.listGroupedStory[index].items!.length==1){
                          controller.pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                        }else
                        if(controller.selectedIndex<=controller.listGroupedStory[index].items!.length-1){
                          controller.canScroll=true;
                          controller.selectedIndex--;
                          controller.pageControllerItem.previousPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                          controller.update();
                        }

                      } else if (delta < 0) {
                        debugPrint("➡️ Dragging FORWARD");
                        if(controller.selectedIndex==controller.listGroupedStory[index].items!.length-1){
                          controller.canScroll=false;
                          controller.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);

                        }
                      }
                    },
                    child: PageView.builder(controller: controller.pageControllerItem,physics: controller.listGroupedStory[index].items?.length==1?NeverScrollableScrollPhysics(): controller.canScroll?AlwaysScrollableScrollPhysics():NeverScrollableScrollPhysics(),onPageChanged: (currentPage){

                      controller.selectedIndex=currentPage;
                      if(currentPage==listGroupedStory[index].items!.length-1){
                        controller.canScroll=false;
                      }else{
                        controller.canScroll=true;
                      }
                      controller.update();

                      controller.startProgressTimer();

                    },itemCount: listGroupedStory[index].items?.length,itemBuilder: (itemBuilder,indexItem){
                      return InkWell(onTap: (){
                        controller.tapToNext();
                      },
                        child: Stack(
                          children: [
                            ImageCommon("${controller.listGroupedStory[index].items?[indexItem].mediaUrl}",boxFit: BoxFit.fitWidth,),
                            Positioned(bottom:24,left: 24,right: 24,child: Row(spacing: 8,mainAxisAlignment: MainAxisAlignment.center,children: [
                              Icon(Icons.remove_red_eye_outlined,color: Colors.black54,),
                              SmallText(text: "${controller.listGroupedStory[index].items?[indexItem].viewCount}",color: Colors.black54,size: 16,)
                            ],),)
                          ],
                        ),
                      );
                    }),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Column(spacing: 16,children: [

                      SizedBox(height: 4,
                        child: Row(children: List.generate(controller.listGroupedStory[index].items?.length ?? 0, (x) {
                          return Expanded(child: Container(height: 4, margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(color: x < controller.selectedIndex ? Colors.green : Color(0xFFBAB8B8),borderRadius: BorderRadius.circular(4),),
                            child:
                            x == controller.selectedIndex
                                ? FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: controller.progress, child: Container(decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4),),),)
                                : null,
                          ),
                          );
                        },),),
                      ),

                      Row(spacing: 16,children: [
                        Icon(Icons.arrow_back_ios_new_outlined),
                        ImageCommon("${controller.listGroupedStory[index].image}",sizeAndCircle: 40,),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            SmallText(text: "${controller.listGroupedStory[index].name}",fontWeight: FontWeight.w600,size: 15,),
                            SmallText(text: formatDateRelative(controller.selectedIndex< controller.listGroupedStory[index].items!.length ?controller.listGroupedStory[index].items![controller.selectedIndex].createdAt:"----"),color: Colors.black54,)
                          ],),
                        ),
                      ],),
                    ],),
                  )
                ],
              );
            }),
          );
        }
    );
  }
}
