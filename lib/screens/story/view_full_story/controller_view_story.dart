import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../model/model_x.dart';
import '../../../model/story_model.dart';
import '../../../network_handling/network_manager.dart';
import '../../../utils/app_urls.dart';
import '../controller_main_story.dart';

class ControllerViewStory extends GetxController{

  int selectedIndex=0;
  PageController pageController=PageController();
  double progress=0.0;
  Timer? timer;
  int indexx;

  List<GroupedStories>? listStory;
  List<Stories>? listMyStory;

  ControllerViewStory({this.listStory, this.listMyStory,required this.indexx});

  @override
  void onInit() {
    super.onInit();
    if(listMyStory!=null && listMyStory!.isNotEmpty){
      selectedIndex=indexx;
    }
    pageController=PageController(initialPage: selectedIndex);
    try{
      // if(listStory!=null && listStory!.isNotEmpty && listStory?[selectedIndex].viewed!=true)postData(listStory?[selectedIndex].id);
    }catch(e){}
    // startProgressTimer();
  }

  @override
  void onClose() {
    pageController.dispose();
    if(timer!=null)timer!.cancel();
    super.onClose();
  }


  // startProgressTimer(){
  //   progress = 0.0;
  //   timer?.cancel();
  //   timer = Timer.periodic(Duration(milliseconds: 100), (callback){
  //     progress += 0.01;
  //     if (progress >= 1.0) {
  //       progress = 0.0;
  //       if(timer!=null)timer?.cancel();
  //       nextStory();
  //     }
  //     update();
  //   });
  // }

  void nextStory() {
    var length=0;
    if(listStory!.isNotEmpty){
      length=listStory!.length-1;
    }else{
      length=listMyStory!.length-1;
    }
    if (selectedIndex < length) {
      selectedIndex++;
      pageController.jumpToPage(selectedIndex);
      // startProgressTimer();
      update();
    } else {
      timer?.cancel();
      progress=1;
      // nextUserStory();
    }
    update();
  }
  // nextUserStory(){
  //
  //   ControllerMainStory controllerMainStory=Get.find();
  //   if(listStory!=null && listStory!.isNotEmpty && controllerMainStory.listGroupedStory.length-1>indexx){
  //     listStory!.clear();
  //     indexx++;
  //     selectedIndex=0;
  //     // startProgressTimer();
  //     // listStory=controllerMainStory.listGroupedStory[indexx].items;
  //     update();
  //   }
  // }

  postData(storyId) async {
    try{
      // var res=await NetworkManager().post(AppUrls.storyViewCount,data: {
      //   "story_id":"$storyId"
      // });
      // print(res);
      // ModelX modelX=ModelX.fromJson(res);

      // if(modelX.status==200){
      //   if(listStory!=null){
      //     int ind=listStory!.indexWhere((test)=>test.id==storyId);
      //     print("INDDDDD $ind");
      //     if(ind!=-1){
      //       listStory![ind].setViewed(true);
      //       update();
      //     }
      //   }
        try{
          ControllerMainStory controllerMainStory=Get.find();
          final groupIndex = controllerMainStory.listGroupedStory.indexWhere((group) => group.items?.any((item) => item.id == storyId) ?? false,);
          print("${groupIndex} ---- group index");
          if (groupIndex == -1) return;
          final itemIndex = controllerMainStory.listGroupedStory[groupIndex].items!.indexWhere((item) => item.id == storyId);
          print("${groupIndex} ---- item index");
          if (itemIndex == -1) return;
          controllerMainStory.listGroupedStory[groupIndex].items![itemIndex].setViewed(true);
          controllerMainStory.update();

        }catch(e){}
      // }

      // if(listStory!.isNotEmpty)listStory![selectedIndex].setViewed(true);
      // if(listMyStory!.isNotEmpty)listMyStory![selectedIndex].setViewed(true);
    }catch(e){}

  }
}