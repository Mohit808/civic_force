import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/story_model.dart';

class ControllerFullStory extends GetxController{

  List<GroupedStories> listGroupedStory=[];
  ControllerFullStory({required this.listGroupedStory});

  bool canScroll=true;
  int selectedIndex=0;
  double progress=0.0;
  Timer? timer;

  PageController pageController=PageController();
  PageController pageControllerItem=PageController();
  dynamic dragStart;
  DateTime? lastDragActionTime;



  @override
  void onInit() {
    super.onInit();
    startProgressTimer();
  }


  startProgressTimer(){
    progress = 0.0;
    timer?.cancel();
    timer = Timer.periodic(Duration(milliseconds: 100), (callback){
      progress += 0.01;
      // print(progress);
      if (progress >= 1.0) {
        // progress = 0.0;
        // print("progress : $progress");
        tapToNext();

        if(timer!=null)timer?.cancel();
      }
      update();
    });
  }

  tapToNext(){
    if( selectedIndex < listGroupedStory[pageController.page!.toInt()].items!.length-1){
      pageControllerItem.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }else if(pageController.page!.toInt() < listGroupedStory.length-1){
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }else{
      timer?.cancel();
      Get.back();
    }
  }

  bool canTriggerDrag() {
    if (lastDragActionTime == null) {
      lastDragActionTime = DateTime.now();
      return true;
    }

    final diff = DateTime.now().difference(lastDragActionTime!);
    if (diff.inMilliseconds >= 300) {
      lastDragActionTime = DateTime.now();
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    pageControllerItem.dispose();
    super.dispose();
  }

}