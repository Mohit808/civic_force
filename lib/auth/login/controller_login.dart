import 'package:civic_force/screens/basic_details/basic_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard_screen.dart';
import '../../model/user_model.dart';
import '../../network_handling/api_response.dart';
import '../../network_handling/network_manager.dart';
import '../../utils.dart';
import '../../utils/app_urls.dart';

class ControllerLogin extends GetxController{

  TextEditingController textEditingControllerEmail=TextEditingController();
  TextEditingController textEditingControllerPass=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);

  @override
  void onInit() {
    super.onInit();
  }

  buttonColor(){
    if(formKey.currentState!=null &&formKey.currentState!.validate()){
      return Colors.green;
    }
    return Color(0xFF2F322F);
  }

  postData() async {
    if(!formKey.currentState!.validate()) return;
    if(apiResponse.status==Status.LOADING) return;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppUrls.emailLogin,data: {
        "email":textEditingControllerEmail.text,
        "password":textEditingControllerPass.text
      });
      print(res);
      print({
        "email":textEditingControllerEmail.text,
        "password":textEditingControllerPass.text
      });
      UserModel userModel=UserModel.fromJson(res);
      if(userModel.status==200){
        token=userModel.data?.token??"";
        userInfo=userModel.data!.userInfo;

        box.write(Utils.userToken, userModel.data?.token);
        box.write(Utils.user, userModel.data?.userInfo?.toJson());
        box.write(Utils.intro, true);
        showToastSuccess(userModel.message!);
        // AwesomeNotificationController().updateFcmToken();

        Get.offAll(()=>BasicDetailsScreen());
      }else{
        showToastError(userModel.message!);
        print(userModel.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }

    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();

  }

}