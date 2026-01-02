// import 'package:civic_force/common_widget/app_colors.dart';
// import 'package:civic_force/screens/story/full_story/full_story_screen.dart';
// import 'package:civic_force/screens/story/widget/whatsapp_sqare_story_widget.dart';
// import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import '../../../common_widget/app_bar.dart';
// import '../../../common_widget/network_image_widget.dart';
// import '../../../model/story_model.dart';
// import '../controller_main_story.dart';
//
// class AllStoriesScreen extends StatelessWidget {
//   const AllStoriesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerMainStory(),
//       builder: (controller) {
//         return Scaffold(
//           appBar: AppBarCommon(title: "Stories".tr,color: AppColors.scaffoldBackgroundColor,colorIconTheme: Colors.black,titleColor: Colors.black,centerTitle: false,),
//           body: SmartRefresher(controller: controller.refreshControllerStory,
//             enablePullUp: controller.loadMoreStory,
//             onRefresh: controller.refreshStoryData,
//             onLoading: controller.fetchStoryData,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
//                 child: Column(children: [
//                   GridView.builder(itemCount: controller.listGroupedStory.length,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 250), itemBuilder: (itemBuilder,index){
//                     return Stack(
//                       children: [
//                         InkWell(onTap: (){
//                           Get.to(()=>FullStoryScreen(listGroupedStory: controller.listGroupedStory,initialIndex: index,));
//                         },child: WhatsAppSquareStoryWidget(isViewedList: controller.listGroupedStory[index].items!.map((toElement)=>toElement.viewed!).toList(), child: ImageCommon(controller.listGroupedStory[index].items!.first.mediaUrl,borderRadius: 10,))),
//
//                         Padding(padding: const EdgeInsets.only(top: 4.0,left: 4),
//                           child: InkWell(onTap: (){
//                             Get.to(()=>UserProfileScreen(userId: controller.listGroupedStory[index].userId,name: controller.listGroupedStory[index].name,image: controller.listGroupedStory[index].image));
//                           },child: ImageCommon(controller.listGroupedStory[index].image??"",height: 40,width: 40,borderRadius: 30,)),
//                         ),
//                       ],
//                     );
//                   }),
//
//                 ],),
//               ),
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
