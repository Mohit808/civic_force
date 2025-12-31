import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data_source/upload_to_s3.dart';
import '../../model/model_x.dart';
import '../../model/story_model.dart';
import '../../network_handling/api_response.dart';
import '../../network_handling/network_manager.dart';
import '../../utils.dart';
import '../../utils/app_urls.dart';

class ControllerMainStory extends GetxController{

  List<Stories> listMyStory=[];
  List<GroupedStories> listGroupedStory=[];
  ApiResponse apiResponseStory=ApiResponse(status: Status.LOADING);
  ApiResponse apiResponseUploading=ApiResponse(status: Status.INITIAL);
  int pageStory=1;
  bool loadMoreStory=false;
  RefreshController refreshControllerStory=RefreshController();

  @override
  void onInit() {
    super.onInit();
    fetchStoryData();
  }



  refreshStoryData(){
    listMyStory=[];
    listGroupedStory=[];
    apiResponseStory=ApiResponse(status: Status.LOADING);
    pageStory=1;
    loadMoreStory=false;
    fetchStoryData();
    update();
  }

  fetchStoryData() async {
    var res=await NetworkManager().get("${AppUrls.story}?page=$pageStory");
    print(res);
    try{
      StoryModel storyModel=StoryModel.fromJson(res);
      if((storyModel.data?.groupedStories?.length ?? storyModel.data?.myStories?.length)==10){
        pageStory++;
        loadMoreStory=true;
      }else{
        loadMoreStory=false;
      }
      // listStory.addAll(storyModel.data?.stories??[]);
      listMyStory.addAll(storyModel.data?.myStories??[]);
      listGroupedStory.addAll(storyModel.data?.groupedStories??[]);
    }catch(e){}
    apiResponseStory=ApiResponse(status: Status.COMPLETED);
    refreshControllerStory.refreshCompleted();
    refreshControllerStory.loadComplete();
    update();
    print(listMyStory.length);
  }

  storyFunction({path,text,status}) async {
    if(apiResponseUploading.status==Status.LOADING) return;
    apiResponseUploading=ApiResponse(status: Status.LOADING);
    update();
    try {
      var imageUrl=await uploadImageToS3(path);
      if(imageUrl!=null){
        var res=await NetworkManager().post(AppUrls.story,data: {"media_url":imageUrl,"text":text,"status":status});
        debugPrint("$res");
        ModelX modelX=ModelX.fromJson(res);
        if(modelX.status==200){
          listMyStory.add(Stories.fromJson(modelX.data));
          showToastSuccess("${modelX.message}");
          Get.back();
        }
      }
    }catch(e){debugPrint("$e");}
    apiResponseUploading=ApiResponse(status: Status.COMPLETED);
    update();
  }

  deleteStoryFunction(storyId) async {
    try{
      var res=await NetworkManager().delete(AppUrls.story,data: {"story_id":"$storyId"});
      debugPrint("$res");
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        listMyStory.removeWhere((test)=>test.id==storyId);
        showToastSuccess(modelX.message);
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }
    update();
  }


}