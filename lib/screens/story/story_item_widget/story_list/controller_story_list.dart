import 'dart:async';
import 'package:civic_force/screens/story/view_full_story/controller_view_story.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../model/story_model.dart';

class ControllerStoryList extends GetxController{
  int selectedIndex=0;
  double progress=0.0;
  Timer? timer;
  PageController pageController=PageController();

  List<Stories>? list=[];
  ControllerStoryList({this.list});


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
      print(progress);
      if (progress >= 1.0) {
        progress = 0.0;
        print("progress : $progress");
        nextUserStory();
        if(timer!=null)timer?.cancel();
      }
      update();
    });
  }


  nextUserStory(){
    print("XXYXYXYYXYX");
    print(selectedIndex);
    print(list!.length-1);
    if(selectedIndex==list!.length-1){
      startProgressTimer();

      try{
        ControllerViewStory controllerViewStory=Get.find();
        if(controllerViewStory.selectedIndex<controllerViewStory.listStory!.length-1){
          controllerViewStory.selectedIndex++;
          controllerViewStory.pageController.animateToPage(controllerViewStory.selectedIndex, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          controllerViewStory.update();
        }

      }catch(e){
        print(e);
      }
      return;
    }
    selectedIndex++;
    pageController.animateToPage(selectedIndex, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    startProgressTimer();


    // ControllerMainStory controllerMainStory=Get.find();
    // if(listStory!=null && listStory!.isNotEmpty && controllerMainStory.listGroupedStory.length-1>indexx){
    //   listStory!.clear();
    //   indexx++;
    //   selectedIndex=0;
    //   // startProgressTimer();
    //   // listStory=controllerMainStory.listGroupedStory[indexx].items;
    //   update();
    // }
  }
}