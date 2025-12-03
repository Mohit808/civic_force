import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/model_x.dart';
import '../../network_handling/api_response.dart';
import '../../network_handling/network_manager.dart';
import '../../utils.dart';
import '../../utils/app_urls.dart';
import 'email_otp/email_otp_screen.dart';

class ControllerForgetPassword extends GetxController{
  TextEditingController textEditingControllerEmail=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);

  final dynamic email;
  ControllerForgetPassword({this.email});

  @override
  void onInit() {
    super.onInit();
    if(email!=null && "$email".isNotEmpty)textEditingControllerEmail.text="$email";
  }


  postData() async {
    if(!formKey.currentState!.validate()) return;
    if(apiResponse.status==Status.LOADING) return;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppUrls.forgotPassword,data: {
        "email":textEditingControllerEmail.text
      });
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        Get.off(()=>EmailOtpScreen(emailId: textEditingControllerEmail.text,));
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