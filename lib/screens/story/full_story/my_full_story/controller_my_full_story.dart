// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../../../../model/story_model.dart';
//
// class ControllerMyFullStory extends GetxController{
//   int selectedIndex=0;
//   double progress=0.0;
//   Timer? timer;
//   PageController pageController=PageController();
//   final List<Stories> list;
//   ControllerMyFullStory({required this.list});
//
//   @override
//   void onInit() {
//     super.onInit();
//     startProgressTimer();
//   }
//
//   startProgressTimer(){
//     progress = 0.0;
//     timer?.cancel();
//     timer = Timer.periodic(Duration(milliseconds: 100), (callback){
//       progress += 0.01;
//       // print(progress);
//       if (progress >= 1.0) {
//         // progress = 0.0;
//         print("progress : $progress");
//         if(timer!=null)timer?.cancel();
//         tapToNext();
//       }
//       update();
//     });
//   }
//
//   tapToNext(){
//     if(selectedIndex<list.length-1){
//       pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//       startProgressTimer();
//     }else{
//       timer?.cancel();
//       Get.back();
//     }
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
// }