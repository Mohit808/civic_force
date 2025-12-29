import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/model_x.dart';
import '../../../network_handling/network_manager.dart';
import '../../../utils.dart';
import '../../../utils/app_urls.dart';

class ControllerFeedback extends GetxController{
  TextEditingController textEditingController=TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }
  postData() async {
    if(textEditingController.text.isEmpty)return;
    try{
      var res=await NetworkManager().post(AppUrls.feedback,data: {
        "feedback":textEditingController.text
      });
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess("Feedback sent successfully");
        Get.back();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }
  }
}