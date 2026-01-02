// import 'dart:async';
//
// import 'package:civic_force/screens/story/controller_main_story.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../../../model/model_x.dart';
// import '../../../model/story_model.dart';
// import '../../../network_handling/network_manager.dart';
// import '../../../utils/app_urls.dart';
//
// class ControllerFullStory extends GetxController{
//
//   List<GroupedStories> listGroupedStory=[];
//   final int? initialIndex;
//   final int? initialIndexItem;
//   ControllerFullStory({required this.listGroupedStory,this.initialIndex,this.initialIndexItem});
//
//   bool canScroll=true;
//   int selectedIndex=0;
//   double progress=0.0;
//   Timer? timer;
//
//
//   PageController pageController=PageController();
//   PageController pageControllerItem=PageController();
//   dynamic dragStart;
//   DateTime? lastDragActionTime;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     startProgressTimer();
//     if(initialIndex!=null){
//       pageController=PageController(initialPage: initialIndex!);
//       postData(listGroupedStory[initialIndex!].items![initialIndexItem??0].id);
//     }
//     if(initialIndexItem!=null){
//       pageControllerItem=PageController(initialPage: initialIndexItem!);
//       selectedIndex=initialIndexItem!;
//     }
//   }
//
//
//   startProgressTimer(){
//     progress = 0.0;
//     timer?.cancel();
//     timer = Timer.periodic(Duration(milliseconds: 100), (callback){
//       progress += 0.01;
//       // print(progress);
//       if (progress >= 1.0) {
//         // progress = 0.0;
//         // print("progress : $progress");
//         tapToNext();
//
//         if(timer!=null)timer?.cancel();
//       }
//       update();
//     });
//   }
//
//   tapToNext(){
//     if( selectedIndex < listGroupedStory[pageController.page!.toInt()].items!.length-1){
//       pageControllerItem.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//     }else if(pageController.page!.toInt() < listGroupedStory.length-1){
//       pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//     }else{
//       timer?.cancel();
//       Get.back();
//     }
//   }
//
//   bool canTriggerDrag() {
//     if (lastDragActionTime == null) {
//       lastDragActionTime = DateTime.now();
//       return true;
//     }
//
//     final diff = DateTime.now().difference(lastDragActionTime!);
//     if (diff.inMilliseconds >= 300) {
//       lastDragActionTime = DateTime.now();
//       return true;
//     }
//     return false;
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     pageController.dispose();
//     pageControllerItem.dispose();
//     super.dispose();
//   }
//
//
//   postData(storyId) async {
//     try{
//       var res=await NetworkManager().post(AppUrls.storyViewCount,data: {
//         "story_id":"$storyId"
//       });
//       print(res);
//       ModelX modelX=ModelX.fromJson(res);
//       if(modelX.status==200){
//         ControllerMainStory controllerMainStory=Get.find();
//         final groupIndex = controllerMainStory.listGroupedStory.indexWhere((group) => group.items?.any((item) => item.id == storyId) ?? false,);
//         if (groupIndex == -1) return;
//         final itemIndex = controllerMainStory.listGroupedStory[groupIndex].items!.indexWhere((item) => item.id == storyId);
//         if (itemIndex == -1) return;
//         controllerMainStory.listGroupedStory[groupIndex].items![itemIndex].setViewed(true);
//         controllerMainStory.update();
//
//       }
//     }catch(e){}
//
//   }
//
// }