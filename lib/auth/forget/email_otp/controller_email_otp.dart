import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/model_x.dart';
import '../../../model/user_model.dart';
import '../../../network_handling/api_response.dart';
import '../../../network_handling/network_manager.dart';
import '../../../utils.dart';
import '../../../utils/app_urls.dart';
import '../reset_pass/reset_pass_screen.dart';

class ControllerEmailOtp extends GetxController{
  GlobalKey<FormState> formKeyOtp=GlobalKey();
  TextEditingController textEditingControllerOtp=TextEditingController();
  ApiResponse apiResponseOtp=ApiResponse(status: Status.INITIAL);
  ApiResponse apiResponseResend=ApiResponse(status: Status.INITIAL);

  Timer? timer;
  int remainingSeconds = 5 * 60;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    if(timer!=null)timer!.cancel();
    timer=null;
    super.onClose();
  }
  @override
  void dispose() {
    if(timer!=null)timer!.cancel();
    timer=null;
    super.dispose();
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  startTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (callback){
      if (remainingSeconds == 0) {
        if(timer!=null)timer!.cancel();
      } else {
        remainingSeconds--;
        update();
      }
    });
  }

  resendOtp(emailId) async {
    apiResponseResend=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppUrls.forgotPassword,data: {
        "email":"$emailId"
      });
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        remainingSeconds= 5 *60;
        if(timer!=null)timer!.cancel();
        startTimer();
        showToastSuccess(modelX.message);
      }else{
        showToastError(modelX.message);
      }
    }catch(e){}
    apiResponseOtp=ApiResponse(status: Status.INITIAL);
    update();
  }

  verifyOtp(emailId) async {
    if(!formKeyOtp.currentState!.validate()) return;
    if(apiResponseOtp.status==Status.LOADING) return;
    try{
      apiResponseOtp=ApiResponse(status: Status.LOADING);
      update();
      var res=await NetworkManager().post(AppUrls.verifyForgotPassword,data: {
        "email":emailId,
        "otp":textEditingControllerOtp.text,
      });
      print(res);
      UserModel userModel=UserModel.fromJson(res);
      if(userModel.status==200){
        token=userModel.data?.token??"";
        // userInfo=userModel.data!.userInfo;
        //
        // box.write(Utils.userToken, userModel.data?.token);
        // box.write(Utils.user, userModel.data?.userInfo?.toJson());
        // box.write(Utils.intro, true);
        showToastSuccess(userModel.message!);
        // AwesomeNotificationController().updateFcmToken();
        Get.off(()=>ResetPassScreen(email: emailId,otp: textEditingControllerOtp.text,));
      }else{
        showToastError(userModel.message);
      }
    }catch(e){
      showToastError("Something went wrong");
      print(e);
    }
    apiResponseOtp=ApiResponse(status: Status.COMPLETED);
    update();
  }

}