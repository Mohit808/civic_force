// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:red_strap/custom_functions.dart';
// import 'package:red_strap/screens/dashboard/dashboard_screen.dart';
//
// import '../../../awesome_notification/awesome_notification_controller.dart';
// import '../../../models/user_model.dart';
// import '../../../network_handling/api_response.dart';
// import '../../../network_handling/network_manager.dart';
// import '../../../screens/basic_details/advanced_detail/advance_details_screen.dart';
// import '../../../screens/basic_details/basic_details_screen.dart';
// import '../../../screens/basic_details/birth_details/birth_details_screen.dart';
// import '../../../utils.dart';
// import '../../../utils/app_urls.dart';
//
// class ControllerOtp extends GetxController{
//   GlobalKey<FormState> formKeyOtp=GlobalKey();
//   TextEditingController textEditingControllerOtp=TextEditingController();
//   ApiResponse apiResponseOtp=ApiResponse(status: Status.INITIAL);
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//
//   verifyOtp(mobileNumber) async {
//     if(!formKeyOtp.currentState!.validate()) return;
//     try{
//       apiResponseOtp=ApiResponse(status: Status.LOADING);
//       update();
//       var res=await NetworkManager().post(AppUrls.verifyOtp,data: {
//         "phone_number":mobileNumber,
//         "otp":textEditingControllerOtp.text,
//       });
//       UserModel userModel=UserModel.fromJson(res);
//       if(userModel.status==200){
//         token=userModel.data?.token??"";
//         userInfo=userModel.data!.userInfo;
//
//         box.write(Utils.userToken, userModel.data?.token);
//         box.write(Utils.user, userModel.data?.userInfo?.toJson());
//         box.write(Utils.intro, true);
//         showToastSuccess(userModel.message!);
//         apiResponseOtp=ApiResponse(status: Status.COMPLETED);
//         CustomFunction().navigateAfterLogin();
//       }
//     }catch(e){
//       showToastError("Something went wrong");
//     }
//   }
//
// }