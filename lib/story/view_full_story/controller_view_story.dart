import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/model_x.dart';
import '../../model/story_model.dart';
import '../../network_handling/network_manager.dart';
import '../../utils/app_urls.dart';

class ControllerViewStory extends GetxController{

  int selectedIndex=0;
  PageController pageController=PageController();
  double progress=0.0;
  Timer? timer;
  final int indexx;

  final List<Stories>? listStory;
  final List<Stories>? listMyStory;

  ControllerViewStory({this.listStory, this.listMyStory,required this.indexx});

  @override
  void onInit() {
    super.onInit();
    selectedIndex=indexx;
    pageController=PageController(initialPage: selectedIndex);
    if(listStory!.isNotEmpty && listStory?[selectedIndex].viewed==null)postData(listStory?[selectedIndex].id);
    if(listMyStory!.isNotEmpty && listMyStory?[selectedIndex].viewed==null)postData(listMyStory?[selectedIndex].id);
    startProgressTimer();
  }

  @override
  void onClose() {
    pageController.dispose();
    if(timer!=null)timer!.cancel();
    super.onClose();
  }


  startProgressTimer(){
    progress = 0.0;
    timer?.cancel();
    timer = Timer.periodic(Duration(milliseconds: 100), (callback){
      progress += 0.01;
      if (progress >= 1.0) {
        progress = 0.0;
        if(timer!=null)timer?.cancel();
        print("ooooooooooooooooopppppppppppppppssssss");
        nextStory();
      }
      update();
    });
  }

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
      startProgressTimer();
      update();
    } else {
      timer?.cancel();
      progress=1;
    }
    update();
  }

  postData(storyId) async {
    try{
      var res=await NetworkManager().post(AppUrls.storyViewCount,data: {
        "story_id":"$storyId"
      });
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(listStory!.isNotEmpty)listStory![selectedIndex].setViewed(true);
      if(listMyStory!.isNotEmpty)listMyStory![selectedIndex].setViewed(true);
    }catch(e){}

  }
}