import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/model_x.dart';
import '../../../network_handling/api_response.dart';
import '../../../network_handling/network_manager.dart';
import '../../../utils.dart';
import '../../../utils/app_urls.dart';

class ControllerResetPassword extends GetxController{
  GlobalKey<FormState> formKey=GlobalKey();
  TextEditingController textEditingControllerPassword=TextEditingController();
  TextEditingController textEditingControllerConfirm=TextEditingController();
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  @override
  void onInit() {
    super.onInit();
  }
  
  postData({email,otp}) async {
    if(!formKey.currentState!.validate()) return;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppUrls.resetPassword,data: {
        "email":"$email",
        "otp":"$otp",
        "new_password":textEditingControllerPassword.text
      });
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        Get.back();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }

    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
  }
}