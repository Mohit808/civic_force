import 'dart:convert';

import 'package:civic_force/model/search_user_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../config/cloudinary.dart';
import '../../model/model_x.dart';
import '../../services/location_service.dart';

class ControllerCreatePost extends GetxController{
  TextEditingController textEditingControllerTags=TextEditingController();
  TextEditingController textEditingControllerText=TextEditingController();
  TextEditingController textEditingControllerUsers=TextEditingController();
  List<String> listSelectedImage=[];
  bool showOnMapValue=false;
  LatLng? latLng;
  FocusNode focusNode=FocusNode();
  FocusNode focusNode2=FocusNode();
  bool showUserTag=false;

  List selectedTagList=[];
  List<Data> selectedUserList=[];
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);

  String? selectedAddress;

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
      List<String> listImages=[];
      for(var x in listSelectedImage){
        var image=await CloudinarySetup().upload(x);
        listImages.add(image);
      }

      var res=await NetworkManager().post(AppUrls.post,data: jsonEncode({
        "text":textEditingControllerText.text,
        "image":listImages.join(","),
        "people_tagged":selectedUserList.map((toElement)=>toElement.userId).toList(),
        "tags":selectedTagList,
        "location": selectedAddress??"",
        "latitude":latLng?.latitude??"",
        "longitude":latLng?.longitude??""
      }));
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        Get.back();
      }
      apiResponse=ApiResponse(status: Status.COMPLETED);
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
  }

  Future<List<Data>> fetchUsers() async {
    var res=await NetworkManager().get("${AppUrls.userSearch}?search=${textEditingControllerTags.text}");
    print(res);
    SearchUserModel searchUserModel=SearchUserModel.fromJson(res);
    List<Data> list=[];
    for(var x in searchUserModel.data!){
      list.add(x);
    }
    return list;
  }

  locateMe() async {
    LocationService locationService = LocationService();
    LocationData? loc = await locationService.getCurrentLocation();

    if (loc != null) {
      print("Latitude: ${loc.latitude}");
      print("Longitude: ${loc.longitude}");
      try{
        await LocationService().decodeLocation(LatLng(loc.latitude??0, loc.longitude??0));
      }catch(e){}

    } else {
      print("Location permission denied or service disabled");
    }
  }
}