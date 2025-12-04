import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:civic_force/story/view_full_story/view_full_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/container_decorated.dart';
import '../../common_widget/text_common.dart';
import '../../utils.dart';
import '../common_widget/network_image_widget.dart';
import '../network_handling/api_response.dart';
import '../screens/shimmer/shimmer_story_widget.dart';
import 'all_stories/all_stories_screen.dart';
import 'controller_main_story.dart';

class StoryMainWidget extends StatelessWidget {
  const StoryMainWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMainStory(),
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: SizedBox(height: 120,
                child: Row(
                  children: [
                    ContainerDecorated(onTap: (){

                      showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(spacing: 24,mainAxisSize: MainAxisSize.min,children: [
                            if(controller.listMyStory.isNotEmpty)InkWell(onTap: (){
                              Get.to(()=>ViewFullStoryScreen(listMyStory: controller.listMyStory,listStory: [],indexx: 0,));
                            },
                              child: Row(spacing: 16,
                                children: [
                                  Icon(Icons.open_in_full),
                                  SmallText(text: "Open in full screen".tr,fontWeight: FontWeight.w600,size: 14,),
                                ],
                              ),
                            ),

                            if(controller.listMyStory.isNotEmpty)InkWell(onTap: (){
                              Get.back();
                              controller.deleteStoryFunction(controller.listMyStory.first.id);
                            },
                              child: Row(spacing: 16,
                                children: [
                                  Icon(Icons.delete_outline_rounded),
                                  SmallText(text: "Delete Story".tr,fontWeight: FontWeight.w600,size: 14,),
                                ],
                              ),
                            ),

                            InkWell(onTap: (){
                              controller.storyFunction(isCamera: true);
                            },
                              child: Row(spacing: 16,
                                children: [
                                  Icon(Icons.camera_alt_outlined),
                                  SmallText(text: "Camera".tr,fontWeight: FontWeight.w600,size: 14,),
                                ],
                              ),
                            ),

                            InkWell(onTap: (){
                              controller.storyFunction();
                            },
                              child: Row(spacing: 16,
                                children: [
                                  Icon(Icons.landscape_outlined),
                                  SmallText(text: "Gallery".tr,fontWeight: FontWeight.w600,size: 14,),
                                ],
                              ),
                            ),
                            SizedBox(),
                            // SizedBox(),
                          ],),
                        );
                      });

                    },color: Color(0xFF191718),width: 90,child: Column(spacing: 10,mainAxisAlignment: MainAxisAlignment.center,children: [
                      Stack(
                        children: [
                          ContainerDecorated(borderRadius: 40,padding: controller.listMyStory.isNotEmpty? 2:0,color: controller.listMyStory.isNotEmpty?Colors.green:Colors.black,child: ClipRRect(borderRadius: BorderRadius.circular(50),child:

                          ImageCommon(height: 60,width: 60,borderRadius: 50, src: '${userInfo?.image}',)

                          )),
                          SizedBox(width: 60,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 45.0),
                                  child: Container(decoration: BoxDecoration(color: Color(0xFF191718),borderRadius: BorderRadius.circular(40)),child: Icon(Icons.add_circle,color: Colors.green,)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SmallText(text: "Your Story".tr,size: 11,fontWeight: FontWeight.w600,color: Colors.white,)
                    ],),),
                    SizedBox(width: 16,),

                    controller.apiResponseStory.status==Status.LOADING?ShimmerStoryWidget() :
                    Row(children: [
                      for(var x in controller.listStory)
                        SizedBox(width: 100,child: Stack(
                          children: [
                            InkWell(onTap: (){
                              Get.to(()=>ViewFullStoryScreen(listMyStory: [],listStory: controller.listStory,indexx: controller.listStory.indexWhere((test)=>test==x),));
                            },child: ImageCommon(height: 120,width: 90,borderRadius: 10,src: "${x.mediaUrl}",fit: BoxFit.cover,)
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0,left: 4),
                              child: InkWell(onTap: (){
                                Get.to(()=>UserProfileScreen());
                                // Get.to(()=>UserDetailsScreen(id: x.user?.userId,name: x.user?.name,image: x.user?.image,navigateOnMessage: true));
                              },child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 0.5)),child: ImageCommon(src: "${x.user?.image}",height: 24,width: 24,borderRadius: 40,))),
                            )
                          ],
                        )),
                      if(controller.listStory.length>9)ContainerDecorated(onTap: (){
                        Get.to(()=>AllStoriesScreen());
                      },paddingEdgeInsets: EdgeInsets.symmetric(vertical: 16,horizontal: 5),color: Color(0xFF7E127E),child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 16,)),
                    ],)
                  ],
                ),
              ),
            ),

            // SizedBox(height: 80,child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (itemBuilder,index){
            //   return Padding(
            //     padding: const EdgeInsets.only(right: 16.0),
            //     child: SizedBox(height: 100,width: 56,
            //       child: Column(
            //         children: [
            //           InkWell(onTap: (){
            //             showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
            //               return Padding(
            //
            //                 padding: const EdgeInsets.all(16.0),
            //                 child: Column(spacing: 24,mainAxisSize: MainAxisSize.min,children: [
            //                   if(controller.listMyStory.isNotEmpty)
            //                     InkWell(onTap: (){
            //                       Get.to(()=>ViewFullStoryScreen(listMyStory: controller.listMyStory,listStory: [],indexx: 0,));
            //                     },
            //                       child: Row(spacing: 16,
            //                         children: [
            //                           Icon(Icons.open_in_full),
            //                           SmallText(text: "Open in full screen".tr,fontWeight: FontWeight.w600,size: 14,),
            //                         ],
            //                       ),
            //                     ),
            //
            //                   if(controller.listMyStory.isNotEmpty)
            //                     InkWell(onTap: (){
            //                       Get.back();
            //                       controller.deleteStoryFunction(controller.listMyStory.first.id);
            //                     },
            //                       child: Row(spacing: 16,
            //                         children: [
            //                           Icon(Icons.delete_outline_rounded),
            //                           SmallText(text: "Delete Story".tr,fontWeight: FontWeight.w600,size: 14,),
            //                         ],
            //                       ),
            //                     ),
            //
            //                   InkWell(onTap: (){
            //                     controller.storyFunction(isCamera: true);
            //                   },
            //                     child: Row(spacing: 16,
            //                       children: [
            //                         Icon(Icons.camera_alt_outlined),
            //                         SmallText(text: "Camera".tr,fontWeight: FontWeight.w600,size: 14,),
            //                       ],
            //                     ),
            //                   ),
            //
            //                   InkWell(onTap: (){
            //                     controller.storyFunction();
            //                   },
            //                     child: Row(spacing: 16,
            //                       children: [
            //                         Icon(Icons.landscape_outlined),
            //                         SmallText(text: "Gallery".tr,fontWeight: FontWeight.w600,size: 14,),
            //                       ],
            //                     ),
            //                   ),
            //                   SizedBox(),
            //                   // SizedBox(),
            //                 ],),
            //               );
            //             });
            //           },
            //             child: Stack(
            //               children: [
            //                 ContainerDecorated(padding: 2,colorBorder: index==0?Colors.blue:Colors.grey,color: Colors.transparent,borderRadius: 50,child: SizedBox(height: 50,width: 50,child: ClipRRect(borderRadius: BorderRadius.circular(50),child: ImageCommon(src: "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,)))),
            //
            //                 index!=0?SizedBox():Positioned(bottom: 0,right: 0,child: ContainerDecorated(borderRadius: 20,color: Colors.blue,padding: 2,child: Icon(Icons.add,color: Colors.white,size: 16,)))
            //               ],
            //             ),
            //           ),
            //           SizedBox(height: 4,),
            //           SmallText(text: index==0?"You":"Username",fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,)
            //         ],
            //       ),
            //     ),
            //   );
            // }),),
          ],
        );
      }
    );
  }
}

