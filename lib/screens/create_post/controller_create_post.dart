import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/cloudinary.dart';

class ControllerCreatePost extends GetxController{
  TextEditingController textEditingControllerTags=TextEditingController();
  TextEditingController textEditingControllerText=TextEditingController();
  TextEditingController textEditingControllerUsers=TextEditingController();
  // var selectedImage;
  List<String> listSelectedImage=[];
  bool showOnMapValue=false;
  dynamic latLng;
  FocusNode focusNode=FocusNode();
  FocusNode focusNode2=FocusNode();
  bool showUserTag=false;

  List selectedTagList=[];
  List selectedUserList=[];
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);

  final dynamic image;

  ControllerCreatePost({this.image});

  @override
  void onInit() {
    super.onInit();
    if(image!=null) {
      showOnMapValue = true;
      listSelectedImage.add(image);
    }
  }
  postData() async {

    if(textEditingControllerText.text.isEmpty && listSelectedImage.isEmpty) return showToast("Please add text or image");
    // if(showOnMapValue && selectedTagList.isEmpty) return showToast("Tags are mandatory");
    if(showOnMapValue && latLng==null) return showToast("Please select location");
    if(apiResponse.status==Status.LOADING) return;

    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      // var image=await CloudinarySetup().upload(selectedImage);
      // print(image);
      // var res=await NetworkManager().post(AppUrls.post,data: {
      //   "tags":selectedTagList.join(","),
      //   "text":textEditingControllerText.text,
      //   "image":image
      // });
      // print(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      Get.back();
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }


  Future<List<String>> fetchTags() async {
    var res=await NetworkManager().get("${AppUrls.tags}?search=${textEditingControllerTags.text}");
    print(res);
    List<String> list=[];
    for(var x in res['data']){
      list.add(x['name']);
    }
    return list;
    // return (res['data'] as List).map<String>((e) => e['name'].toString()).toList();
  }
}