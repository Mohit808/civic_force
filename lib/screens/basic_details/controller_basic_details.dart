import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard_screen.dart';
import '../../model/model_x.dart';
import '../../model/user_model.dart';
import '../../network_handling/api_response.dart';
import '../../network_handling/network_manager.dart';
import '../../utils.dart';
import '../../utils/app_urls.dart';

class ControllerBasicDetails extends GetxController{
  TextEditingController textEditingController=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  String? image;

  @override
  void onInit() {
    super.onInit();
    if(userInfo!=null) textEditingController.text=userInfo?.name??"";
    if(userInfo!=null && userInfo?.image!=null && userInfo!.image!.isNotEmpty) image=userInfo?.image;

    // WidgetsBinding.instance.addPostFrameCallback((callback){
    //   if(box.read(Utils.info)==null){
    //     showDialog(context: Get.context!, builder: (builder){return Dialog(backgroundColor: Color(0xff232323),child: ContentWarningWidget(),);});
    //   }
    // });
  }

  postData() async {
    if(!formKey.currentState!.validate()) return;
    if(apiResponse.status==Status.LOADING) return;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      Map map={"name":textEditingController.text,"image":image??""};
      // var latLngData=box.read(Utils.latLng);
      // if(latLngData!=null){
      //   var lat="$latLngData".split(",")[0];
      //   var lng="$latLngData".split(",")[1];
      //   map['latitude']=lat;
      //   map['longitude']=lng;
      // }
      var res=await NetworkManager().post(AppUrls.userProfile,data: map);
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        if(modelX.data!=null){
          userInfo=UserInfo.fromJson(modelX.data);
          box.write(Utils.user, userInfo?.toJson());
          box.write(Utils.info, "true");
        }
        showToastSuccess(modelX.message!);
        Get.offAll(()=>DashboardScreen());
      }else{
        showToastError(modelX.message);
      }
      apiResponse=ApiResponse(status: Status.COMPLETED);
    }catch(e){
      print(e);
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }

}