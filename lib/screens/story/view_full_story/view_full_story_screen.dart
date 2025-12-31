import 'package:civic_force/screens/story/story_item_widget/story_list/controller_story_list.dart';
import 'package:civic_force/screens/story/story_item_widget/story_list/story_list_widget.dart';
import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';
import '../../../model/story_model.dart';
import '../../../utils/app_images.dart';
import '../../home/home_screen.dart';
import '../story_item_widget/story_full_screen_app_bar.dart';
import '../story_item_widget/story_item_widget.dart';
import 'controller_view_story.dart';

class ViewFullStoryScreen extends StatelessWidget {

  final List<GroupedStories>? listStory;
  final List<Stories>? listMyStory;
  final int indexx;

  const ViewFullStoryScreen({super.key,this.listStory, this.listMyStory, required this.indexx});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerViewStory(listStory: listStory,listMyStory: listMyStory,indexx: indexx),
      builder: (controller) {

        return Scaffold(
          backgroundColor: Colors.black,
          body:

          Stack(
            children: [
              if(controller.listStory!=null && controller.listStory!.isNotEmpty)
                PageView.builder(controller: controller.pageController,onPageChanged: (value){
                controller.selectedIndex=value;
                // controller.startProgressTimer();
                controller.update();
                if(controller.listStory!.isNotEmpty && controller.listStory?[controller.selectedIndex].items?.first.viewed!=true)controller.postData(controller.listStory?[controller.selectedIndex].items!.first.id);
              },itemCount: controller.listStory?.length??0,itemBuilder: (itemBuilder,index){
                return Stack(
                  children: [
                    StoryListWidget(list: controller.listStory![index].items,),

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,top: 45),
                      child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          GetBuilder(init: ControllerStoryList(),
                            builder: (controllerX) {
                              return SizedBox(height: 4,
                                child: Row(children: List.generate(controller.listStory?[index].items?.length ?? 0, (x) {
                                  return Expanded(child: Container(height: 4, margin: const EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(color: x < controllerX.selectedIndex ? Colors.green : Color(0xFFBAB8B8),borderRadius: BorderRadius.circular(4),),
                                    child:
                                    x == controllerX.selectedIndex
                                        ? FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: controllerX.progress, child: Container(decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4),),),)
                                        : null,
                                  ),
                                  );
                                },),),
                              );
                            }
                          ),


                          Row(spacing: 16,
                            children: [
                              InkWell(onTap: (){
                                Get.back();
                              },child: Stack(
                                children: [
                                  Icon(Icons.arrow_back_ios_new_rounded,size: 25,),
                                  Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
                                ],
                              )),

                              InkWell(onTap: (){
                                // Get.to(()=>UserProfileScreen(userId: stories.user?.userId,name:stories.user?.name,image: stories.user?.image,));
                              },
                                child: Row(spacing: 8,children: [
                                  Image.asset("${controller.listStory![index].image}",errorBuilder: (a,b,c){return Image.asset(AppImages.user,height: 30,width: 30,);},),
                                  Column(spacing: 4,mainAxisSize: MainAxisSize.min,children: [
                                    Text("${controller.listStory![index].name}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black54,),],),),
                                    // Text(formatDateRelative("${stories.user?.createdAt}"), style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black54,),],),),
                                  ],),
                                ],),
                              )

                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                );
              }),

              if(controller.listMyStory!=null && controller.listMyStory!.isNotEmpty)
                PageView.builder(controller: controller.pageController,onPageChanged: (value){
                controller.selectedIndex=value;
                // controller.startProgressTimer();
                controller.update();
                // print("AppUrls.storyViewCount");
                // if(controller.listMyStory!.isNotEmpty && controller.listMyStory?[controller.selectedIndex].viewed==null )controller.postData(controller.listMyStory?[controller.selectedIndex].id);
              },itemCount: controller.listMyStory?.length??0,itemBuilder: (itemBuilder,index){
                return StoryItemWidget(stories: controller.listMyStory![index],);
              }),

            ],
          ),
        );
      }
    );
  }
}
