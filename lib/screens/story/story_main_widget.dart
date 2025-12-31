import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common_widget/app_colors.dart';
import '../../common_widget/container_decorated.dart';
import '../../common_widget/network_image_widget.dart';
import '../../common_widget/text_common.dart';
import '../../model/story_model.dart';
import '../../network_handling/api_response.dart';
import '../../utils.dart';
import '../shimmer/shimmer_story_widget.dart';
import 'all_stories/all_stories_screen.dart';
import 'controller_main_story.dart';
import 'dart:math';

import 'full_story/full_story_screen.dart';
import 'my_story/my_story_screen.dart';
import 'story_add_screen/story_add_screen.dart';
import 'view_full_story/view_full_story_screen.dart';
import 'widget/whatsapp_sqare_story_widget.dart';
import 'widget/whatsapp_story_widget.dart';

class StoryMainWidget extends StatelessWidget {
  const StoryMainWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMainStory(),
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Row(
            //   children: [
            //     SizedBox(width: 16,),
            //     InkWell(onTap: (){
            //       if(controller.listMyStory.isNotEmpty){
            //         Get.to(()=>ViewFullStoryScreen(listMyStory: controller.listMyStory,listStory: [],indexx: 0,));
            //         return;
            //       }
            //
            //       showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
            //         return Padding(
            //           padding: const EdgeInsets.all(16.0),
            //           child: Column(spacing: 10,mainAxisSize: MainAxisSize.min,children: [
            //             InkWell(onTap: () async {
            //               Get.back();
            //               var xFile=await ImagePicker().pickImage(source: ImageSource.camera);
            //               if(xFile!=null) Get.to(()=>StoryAddScreen(path: xFile.path,));
            //             },
            //               child: Row(spacing: 16,
            //                 children: [
            //                   SizedBox(),
            //                   Icon(Icons.camera_alt_outlined,size: 30,),
            //                   SmallText(text: "Camera".tr,fontWeight: FontWeight.w700,size: 16),
            //                 ],
            //               ),
            //             ),
            //             Divider(),
            //
            //             InkWell(onTap: () async {
            //               Get.back();
            //               var xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
            //               if(xFile!=null)Get.to(()=>StoryAddScreen(path: xFile.path,));
            //             },
            //               child: Row(spacing: 16,
            //                 children: [
            //                   SizedBox(),
            //                   Icon(Icons.landscape_outlined,size: 30,),
            //                   SmallText(text: "Gallery".tr,fontWeight: FontWeight.w700,size: 16),
            //                 ],
            //               ),
            //             ),
            //             SizedBox(height: 8,),
            //             SizedBox(),
            //           ],),
            //         );
            //       });
            //
            //     },child: Stack(
            //       children: [
            //         WhatsAppStoryWidget(storyCount: controller.listMyStory.length,child: ContainerDecorated(padding: 0,borderRadius: 50,color: AppColors.primary,child: ImageCommon(userInfo?.image,borderRadius: 50,)),),
            //         if(controller.listMyStory.isEmpty)SizedBox(width: 70,
            //           child: Row(mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 45.0),
            //                 child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40)),child: Icon(Icons.add_circle,color: Colors.green,)),
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     )),
            //     SizedBox(width: 16,),
            //     Expanded(
            //       child: InkWell(onTap: (){
            //         Get.to(()=>MyStoryScreen());
            //       },
            //         child: Row(
            //           children: [
            //             Expanded(
            //               child: Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,children: [
            //                 SmallText(text: "Your Story".tr,fontWeight: FontWeight.w800,size: 20,),
            //                 SmallText(text: "Tap to view stories",color: Colors.black54,size: 15,)
            //               ],),
            //             ),
            //             Icon(Icons.settings,color: AppColors.primary,),
            //             SizedBox(width: 16,)
            //           ],
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),

            // SizedBox(height: 36,),
            // controller.apiResponseStory.status!=Status.LOADING && controller.listGroupedStory.isEmpty?SizedBox():
            // Padding(
            //   padding: const EdgeInsets.only(left: 16.0,bottom: 24),
            //   child: SmallText(text: "Recent updates",color: Colors.black54,letterSpacing: 1,fontWeight: FontWeight.w600,size: 18,),
            // ),

            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: SizedBox(height: 120,
                child:
                controller.apiResponseStory.status==Status.LOADING?ShimmerStoryWidget() :
                Row(children: [

                  ContainerDecorated(height: 120,width: 90,colorBorder: Colors.grey.shade300,color: AppColors.scaffoldBackgroundColor,
                    child: InkWell(onTap: (){
                      if(controller.listMyStory.isNotEmpty){
                        Get.to(()=>MyStoryScreen());
                        // Get.to(()=>ViewFullStoryScreen(listMyStory: controller.listMyStory,listStory: [],indexx: 0,));
                        return;
                      }

                      showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(spacing: 10,mainAxisSize: MainAxisSize.min,children: [
                            InkWell(onTap: () async {
                              Get.back();
                              var xFile=await ImagePicker().pickImage(source: ImageSource.camera);
                              if(xFile!=null) Get.to(()=>StoryAddScreen(path: xFile.path,));
                            },
                              child: Row(spacing: 16,
                                children: [
                                  SizedBox(),
                                  Icon(Icons.camera_alt_outlined,size: 30,),
                                  SmallText(text: "Camera".tr,fontWeight: FontWeight.w700,size: 16),
                                ],
                              ),
                            ),
                            Divider(),

                            InkWell(onTap: () async {
                              Get.back();
                              var xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
                              if(xFile!=null)Get.to(()=>StoryAddScreen(path: xFile.path,));
                            },
                              child: Row(spacing: 16,
                                children: [
                                  SizedBox(),
                                  Icon(Icons.landscape_outlined,size: 30,),
                                  SmallText(text: "Gallery".tr,fontWeight: FontWeight.w700,size: 16),
                                ],
                              ),
                            ),
                            SizedBox(height: 8,),
                            SizedBox(),
                          ],),
                        );
                      });

                    },child: Column(spacing: 8,
                      children: [
                        Row(),
                        Stack(
                          children: [
                            WhatsAppStoryWidget(storyCount: controller.listMyStory.length,child: ContainerDecorated(padding: 0,borderRadius: 50,color: AppColors.primary,child: ImageCommon(userInfo?.image,borderRadius: 50,)),),
                            if(controller.listMyStory.isEmpty)SizedBox(width: 70,
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 45.0),
                                    child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40)),child: Icon(Icons.add_circle,color: Colors.green,)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SmallText(text: "Your Story",fontWeight: FontWeight.w600,size: 13,color: Colors.black54,)
                      ],
                    )),
                  ),
                  SizedBox(width: 12,),

                  for(var x in controller.listGroupedStory)
                    SizedBox(width: 100,child: Stack(
                      children: [
                        // InkWell(onTap: (){
                        //   Get.to(()=>ViewFullStoryScreen(listMyStory: [],listStory: x.items!.map((e) => Stories.fromJson(e.toJson())).toList(),indexx:  controller.listGroupedStory.indexWhere((test)=>test.userId==x.userId), ));
                        // },child: ImageCommon(height: 120,width: 90,borderRadius: 10,"${x.items?.first.mediaUrl}")),

                        // InkWell(onTap: (){
                        //   Get.to(()=>ViewFullStoryScreen(listMyStory: [],listStory: x.items!.map((e) => Stories.fromJson(e.toJson())).toList(),indexx:  controller.listGroupedStory.indexWhere((test)=>test.userId==x.userId), ));
                        // },child: WhatsAppSquareStoryWidget(height: 120,width: 90,storyCount: x.items!.length,child: ImageCommon(x.items?.first.mediaUrl,height: 120,width: 90,borderRadius: 10,),)),

                        InkWell(onTap: (){
                          Get.to(()=>FullStoryScreen(listGroupedStory: controller.listGroupedStory,));
                          // Get.to(()=>ViewFullStoryScreen(listMyStory: [],listStory: controller.listGroupedStory,indexx:  controller.listGroupedStory.indexWhere((test)=>test.userId==x.userId), ));
                          // Get.to(()=>ViewFullStoryScreen(listMyStory: [],listStory: x.items!.map((e) => Stories.fromJson(e.toJson())).toList(),indexx:  controller.listGroupedStory.indexWhere((test)=>test.userId==x.userId), ));
                        },child: WhatsAppSquareStoryWidget(height: 120,width: 90,isViewedList: x.items?.map((toElement)=>toElement.viewed??false).toList(),
                        child: ImageCommon(x.items?.first.mediaUrl,height: 120,width: 90,borderRadius: 10,),)),

                        Padding(
                          padding: const EdgeInsets.only(top: 4.0,left: 4),
                          child: InkWell(onTap: (){

                            // Get.to(()=>UserProfileScreen());
                            var nameX;
                            if(x.items!=null && x.items!.isNotEmpty){
                              nameX=x.items?.first.user?.name;
                            }
                            Get.to(()=>UserProfileScreen(userId: x.userId,name: nameX?? x.name,image: x.image,));
                          },child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 0.5)),child: ImageCommon("${x.image}",height: 24,width: 24,borderRadius: 40,))),
                        )
                      ],
                    )),
                  if(controller.listGroupedStory.length>9)ContainerDecorated(onTap: (){
                    Get.to(()=>AllStoriesScreen());
                  },paddingEdgeInsets: EdgeInsets.symmetric(vertical: 16,horizontal: 5),color: Color(0xFF7E127E),child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 16,)),
                ],),
              ),
            ),
          ],
        );
      }
    );
  }
}