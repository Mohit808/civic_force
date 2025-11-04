import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/cloudinary.dart';

class ControllerCreatePost extends GetxController{
  TextEditingController textEditingControllerTags=TextEditingController();
  TextEditingController textEditingControllerText=TextEditingController();
  var selectedImage;
  bool showOnMapValue=false;
  FocusNode focusNode=FocusNode();
  FocusNode focusNode2=FocusNode();

  List selectedTagList=[];
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);

  @override
  void onInit() {
    super.onInit();
  }
  postData() async {

    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      var image=await CloudinarySetup().upload(selectedImage);
      print(image);
      var res=await NetworkManager().post(AppUrls.post,data: {
        "tags":selectedTagList.join(","),
        "text":textEditingControllerText.text,
        "image":image
      });
      print(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      Get.back();
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }
}