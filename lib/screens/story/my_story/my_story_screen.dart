// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../common_widget/app_bar.dart';
// import '../../../common_widget/app_colors.dart';
// import '../../../common_widget/network_image_widget.dart';
// import '../../../common_widget/text_common.dart';
// import '../../home/home_screen.dart';
// import '../controller_main_story.dart';
// import '../full_story/my_full_story/my_full_story_screen.dart';
// import '../story_add_screen/story_add_screen.dart';
//
// class MyStoryScreen extends StatelessWidget {
//   const MyStoryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerMainStory(),
//       builder: (controller) {
//         return Scaffold(
//           appBar: AppBarCommon(title: "My Stories",color: AppColors.primary,),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//
//                 ListView.separated(shrinkWrap: true,itemCount: controller.listMyStory.length,itemBuilder: (itemBuilder,index){
//                   return InkWell(onTap: (){
//                     Get.to(()=>MyFullStoryScreen(list: controller.listMyStory,));
//                     // Get.to(()=>ViewFullStoryScreen(indexx: index,listMyStory: controller.listMyStory,listStory: [],));
//                   },
//                     child: Row(spacing: 16,children: [
//                       ImageCommon("${controller.listMyStory[index].mediaUrl}",height: 40,width: 40,borderRadius: 40,),
//                       Expanded(
//                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
//                           SmallText(text: controller.listMyStory[index].viewCount!=null && controller.listMyStory[index].viewCount!>0?"${controller.listMyStory[index].viewCount} views": "No views",color: Colors.black54,size: 16,),
//                           SmallText(text:  formatDateRelative(controller.listMyStory[index].createdAt),color: Colors.black54,)
//                         ],),
//                       ),
//                       SizedBox(height: 24,width: 24,
//                         child: PopupMenuButton(
//                             // color: Color(0xFF302E2E),
//                             padding: EdgeInsets.zero,
//                             menuPadding: EdgeInsets.zero,
//                             constraints: BoxConstraints(minWidth: 24, minHeight: 24),
//                             iconSize: 24,iconColor: Colors.black54,itemBuilder: (itemBuilder){
//                           return [
//                             PopupMenuItem(onTap: (){
//                               controller.deleteStoryFunction(controller.listMyStory[index].id);
//                             },child: SmallText(text: "Delete",color: Colors.red,fontWeight: FontWeight.w600,))
//                           ];
//                         }),
//                       )
//                     ],),
//                   );
//                 }, separatorBuilder: (BuildContext context, int index) { return Divider(); },),
//
//                 SizedBox(height: 24,),
//                 SmallText(text: "Your stories will disappear after 24 hours",color: Colors.black54,size: 12,)
//
//               ],),
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(backgroundColor: AppColors.primary,onPressed: (){
//             showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(spacing: 10,mainAxisSize: MainAxisSize.min,children: [
//                   InkWell(onTap: () async {
//                     Get.back();
//                     var xFile=await ImagePicker().pickImage(source: ImageSource.camera);
//                     if(xFile!=null) Get.to(()=>StoryAddScreen(path: xFile.path,));
//                   },
//                     child: Row(spacing: 16,
//                       children: [
//                         SizedBox(),
//                         Icon(Icons.camera_alt_outlined,size: 30,),
//                         SmallText(text: "Camera".tr,fontWeight: FontWeight.w700,size: 16,),
//                       ],
//                     ),
//                   ),
//                   Divider(),
//
//                   InkWell(onTap: () async {
//                     Get.back();
//                     var xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
//                     if(xFile!=null)Get.to(()=>StoryAddScreen(path: xFile.path,));
//                   },
//                     child: Row(spacing: 16,
//                       children: [
//                         SizedBox(),
//                         Icon(Icons.landscape_outlined,size: 30,),
//                         SmallText(text: "Gallery".tr,fontWeight: FontWeight.w700,size: 16,),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 8,),
//                   SizedBox(),
//                 ],),
//               );
//             });
//           },child: Icon(Icons.camera_alt),),
//         );
//       }
//     );
//   }
// }
