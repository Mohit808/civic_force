import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../common_widget/app_bar.dart';
import '../../../common_widget/network_image_widget.dart';
import '../../../model/story_model.dart';
import '../controller_main_story.dart';
import '../view_full_story/view_full_story_screen.dart';

class AllStoriesScreen extends StatelessWidget {
  const AllStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMainStory(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBarCommon(title: "Stories".tr,color: Colors.black,),
          body: SmartRefresher(controller: controller.refreshControllerStory,
            enablePullUp: controller.loadMoreStory,
            onRefresh: controller.refreshStoryData,
            onLoading: controller.fetchStoryData,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
                child: Column(children: [
                  GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.listGroupedStory.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16,mainAxisExtent: 250), itemBuilder: (itemBuilder,index){
                    return Stack(fit: StackFit.expand,
                      children: [
                        InkWell(onTap: (){
                          // print(controller.listGroupedStory[index].items!.map((e) => Stories.fromJson(e.toJson())).toList());
                          Get.to(()=>ViewFullStoryScreen(listMyStory: [],listStory: controller.listGroupedStory,indexx: index,));

                          // Get.to(()=>ViewFullStoryScreen(indexx: index,listStory: controller.listGroupedStory,listMyStory: [],));
                        },child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageCommon(controller.listGroupedStory[index].items?.first.mediaUrl??""))),
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(padding: const EdgeInsets.only(top: 4.0,left: 4),
                                  child: InkWell(onTap: (){

                                    // Get.to(()=>UserProfileScreen());
                                    Get.to(()=>UserProfileScreen(userId: controller.listGroupedStory[index].userId,name: controller.listGroupedStory[index].name,image: controller.listGroupedStory[index].image));
                                  },child: ImageCommon(controller.listGroupedStory[index].image??"",height: 30,width: 30,borderRadius: 30,)),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  })


                ],),
              ),
            ),
          ),
        );
      }
    );
  }
}
