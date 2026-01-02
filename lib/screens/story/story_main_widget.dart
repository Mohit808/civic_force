// import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../common_widget/app_colors.dart';
// import '../../common_widget/container_decorated.dart';
// import '../../common_widget/network_image_widget.dart';
// import '../../common_widget/text_common.dart';
// import '../../network_handling/api_response.dart';
// import '../../utils.dart';
// import '../shimmer/shimmer_story_widget.dart';
// import 'all_stories/all_stories_screen.dart';
// import 'controller_main_story.dart';
// import 'full_story/full_story_screen.dart';
// import 'my_story/my_story_screen.dart';
// import 'story_add_screen/story_add_screen.dart';
// import 'widget/whatsapp_sqare_story_widget.dart';
// import 'widget/whatsapp_story_widget.dart';
//
// class StoryMainWidget extends StatelessWidget {
//   const StoryMainWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerMainStory(),
//         builder: (controller) {
//           return Column(crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SingleChildScrollView(scrollDirection: Axis.horizontal,
//                 child: SizedBox(height: 120,
//                   child:
//                   controller.apiResponseStory.status==Status.LOADING?ShimmerStoryWidget() :
//                   Row(children: [
//
//                     SizedBox(height: 120,width: 90,
//                       child: InkWell(onTap: (){
//                         showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
//                           return Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(spacing: 10,mainAxisSize: MainAxisSize.min,children: [
//                               InkWell(onTap: () async {
//                                 Get.back();
//                                 var xFile=await ImagePicker().pickImage(source: ImageSource.camera);
//                                 if(xFile!=null) Get.to(()=>StoryAddScreen(path: xFile.path,));
//                               },
//                                 child: Row(spacing: 16,
//                                   children: [
//                                     SizedBox(),
//                                     Icon(Icons.camera_alt_outlined,size: 30,),
//                                     SmallText(text: "Camera".tr,fontWeight: FontWeight.w700,size: 16),
//                                   ],
//                                 ),
//                               ),
//                               Divider(),
//
//                               InkWell(onTap: () async {
//                                 Get.back();
//                                 var xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
//                                 if(xFile!=null)Get.to(()=>StoryAddScreen(path: xFile.path,));
//                               },
//                                 child: Row(spacing: 16,
//                                   children: [
//                                     SizedBox(),
//                                     Icon(Icons.landscape_outlined,size: 30,),
//                                     SmallText(text: "Gallery".tr,fontWeight: FontWeight.w700,size: 16),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 8,),
//                               SizedBox(),
//                             ],),
//                           );
//                         });
//
//                       },child: Stack(
//                         children: [
//
//                           InkWell(onTap: (){
//                             if(controller.listMyStory.isNotEmpty)Get.to(()=>MyStoryScreen());
//                           },child: controller.listMyStory.isEmpty?ContainerDecorated(colorBorder: Colors.grey.shade400,): WhatsAppSquareStoryWidget(height: 120,width: 90,isViewedList: controller.listMyStory.map((toElement)=>toElement.viewed??false).toList(),
//                             child:  Stack(
//                               children: [
//                                 ImageCommon(controller.listMyStory.first.mediaUrl,height: 120,width: 90,borderRadius: 10,),
//                                 Positioned.fill(child: Container(decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(10)),),)
//                               ],
//                             ),)),
//
//                           Row(mainAxisAlignment: controller.listMyStory.isEmpty? MainAxisAlignment.center:MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:  EdgeInsets.only(top: controller.listMyStory.isEmpty?16:0),
//                                 child: Stack(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(4.0),
//                                       child: WhatsAppStoryWidget(size: controller.listMyStory.isEmpty? 50:35,storyCount: controller.listMyStory.length,child: ContainerDecorated(padding: 0,borderRadius: 50,color: AppColors.primary,child: ImageCommon(userInfo?.image,borderRadius: 50,)),),
//                                     ),
//                                     Positioned(bottom: 0,right: 0,child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40)),child: Icon(Icons.add_circle,color: Colors.green,)))
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           Positioned(bottom: 8,right: 8,left: 8,child: Text( "Your Story",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: controller.listMyStory.isEmpty?Colors.black54:Colors.white),textAlign: TextAlign.center,))
//                         ],
//                       )),
//                     ),
//                     SizedBox(width: 12,),
//
//                     SizedBox(height: 120,
//                       child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: controller.listGroupedStory.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
//                         return SizedBox(width: 100,child: Stack(
//                           children: [
//                             InkWell(onTap: (){
//                               int indexItem=controller.listGroupedStory[index].items!.indexWhere((e) => e.viewed == false) != -1 ? controller.listGroupedStory[index].items!.indexWhere((e) => e.viewed == false) : 0;
//                               Get.to(()=>FullStoryScreen(listGroupedStory: controller.listGroupedStory,initialIndex: index,initialIndexItem: indexItem,));
//                             },child: WhatsAppSquareStoryWidget(height: 120,width: 90,isViewedList: controller.listGroupedStory[index].items?.map((toElement)=>toElement.viewed??false).toList(),
//                               child: Stack(
//                                 children: [
//                                   ImageCommon(controller.listGroupedStory[index].items!.firstWhere((e) => e.viewed != true, orElse: () => controller.listGroupedStory[index].items!.first,).mediaUrl,height: 120,width: 90,borderRadius: 10,),
//                                   Positioned.fill(child: Container(decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10))))
//                                 ],
//                               ),)),
//
//                             Padding(
//                               padding: const EdgeInsets.only(top: 4.0,left: 4),
//                               child: InkWell(onTap: (){
//                                 var nameX;
//                                 if(controller.listGroupedStory[index].items!=null && controller.listGroupedStory[index].items!.isNotEmpty){
//                                   nameX=controller.listGroupedStory[index].items?.first.user?.name;
//                                 }
//                                 Get.to(()=>UserProfileScreen(userId: controller.listGroupedStory[index].userId,name: nameX?? controller.listGroupedStory[index].name,image: controller.listGroupedStory[index].image,));
//                               },child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 0.5)),child: ImageCommon("${controller.listGroupedStory[index].image}",height: 24,width: 24,borderRadius: 40,))),
//                             )
//                           ],
//                         ));
//                       }),
//                     ),
//
//                     // for(var x in controller.listGroupedStory)
//                     //   SizedBox(width: 100,child: Stack(
//                     //     children: [
//                     //       InkWell(onTap: (){
//                     //         Get.to(()=>FullStoryScreen(listGroupedStory: controller.listGroupedStory,initialIndex: 1,));
//                     //       },child: WhatsAppSquareStoryWidget(height: 120,width: 90,isViewedList: x.items?.map((toElement)=>toElement.viewed??false).toList(),
//                     //         child: Stack(
//                     //           children: [
//                     //             ImageCommon(x.items?.first.mediaUrl,height: 120,width: 90,borderRadius: 10,),
//                     //             Positioned.fill(child: Container(decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10))))
//                     //           ],
//                     //         ),)),
//                     //
//                     //       Padding(
//                     //         padding: const EdgeInsets.only(top: 4.0,left: 4),
//                     //         child: InkWell(onTap: (){
//                     //           var nameX;
//                     //           if(x.items!=null && x.items!.isNotEmpty){
//                     //             nameX=x.items?.first.user?.name;
//                     //           }
//                     //           Get.to(()=>UserProfileScreen(userId: x.userId,name: nameX?? x.name,image: x.image,));
//                     //         },child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 0.5)),child: ImageCommon("${x.image}",height: 24,width: 24,borderRadius: 40,))),
//                     //       )
//                     //     ],
//                     //   )),
//                     if(controller.listGroupedStory.length>9)
//                       ContainerDecorated(borderRadius: 30,onTap: (){
//                       Get.to(()=>AllStoriesScreen());
//                     },paddingEdgeInsets: EdgeInsets.symmetric(vertical: 16,horizontal: 5),color: Color(0xFF7E127E),child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 16,)),
//                   ],),
//                 ),
//               ),
//             ],
//           );
//         }
//     );
//   }
// }