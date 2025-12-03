// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../../models/model_x.dart';
// import '../../network_handling/api_response.dart';
// import '../../network_handling/network_manager.dart';
// import '../../screens/basic_details/basic_details_screen.dart';
// import '../../utils.dart';
// import '../../utils/app_urls.dart';
// import 'otp/otp_screen.dart';
//
// class ControllerMobile extends GetxController{
//   GlobalKey<FormState> formKey=GlobalKey();
//   TextEditingController textEditingControllerMobile=TextEditingController();
//   ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   postData() async {
//     try{
//       apiResponse=ApiResponse(status: Status.LOADING);
//       update();
//       var res=await NetworkManager().post(AppUrls.login,data: {
//         "phone_number":textEditingControllerMobile.text
//       });
//       print(res);
//       ModelX modelX=ModelX.fromJson(res);
//       if(modelX.status==200){
//         showToastSuccess(modelX.message!);
//         Get.to(()=>OtpScreen(mobileNumber: textEditingControllerMobile.text,));
//       }
//       apiResponse=ApiResponse(status: Status.COMPLETED);
//     }catch(e){
//       apiResponse=ApiResponse(status: Status.ERROR);
//       print(e);
//     }
//     update();
//   }
//
//
// }