// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../../common_widget/button_single_atom.dart';
// import '../../../common_widget/app_bar.dart';
// import '../../../common_widget/app_colors.dart';
// import '../../../common_widget/otp_atom.dart';
// import '../../../common_widget/text_common.dart';
// import '../../../utils.dart';
// import 'controller_otp.dart';
//
//
// class OtpScreen extends StatelessWidget {
//   const OtpScreen({super.key, this.height, this.titleColor, this.colorBackground, this.mobileNumber});
//
//   final double? height;
//   final Color? titleColor;
//   final Color? colorBackground;
//   final dynamic mobileNumber;
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerOtp(),
//       builder: (controller) {
//         return Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBarCommon(centerTitle: false,title: "",titleColor: titleColor??Colors.white,color:
//           Colors.black,
//           // colorBackground??AppColors.scaffoldBackgroundColor,
//             elevation: 0,colorIconTheme: Colors.white,),
//           body: SingleChildScrollView(
//             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(width: isMobile()?Get.width:Get.width/3,
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//
//
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                         SizedBox(height: 16,),
//                         Row(
//                           children: [
//                             const BigText20(text: "Verification ",color: Colors.white,),
//                             const BigText20(text: "Code",color: Colors.blue,),
//                           ],
//                         ),
//                         const SizedBox(height: 16,),
//                         const SmallText(text: "We have send OTP to your mobile number",color: Colors.white70,),
//                         const SizedBox(height: 4,),
//                         Row(
//                           children: [
//                             SmallText(text: "+91 $mobileNumber",fontWeight: FontWeight.w500,color: Colors.white,),
//                             const SizedBox(width: 16,),
//                             Icon(Icons.edit,size: 13,color: AppColors.primary,),
//                             InkWell(onTap: (){
//                               Get.back();
//                             },child: SmallText(text: " Edit",color: AppColors.primary,fontWeight: FontWeight.w600,))
//                           ],
//                         ),
//                         const SizedBox(height: 48,),
//                         Form(key: controller.formKeyOtp,child: OtpAtom(textEditingController: controller.textEditingControllerOtp)),
//                         const SizedBox(height: 4,),
//                         const Align(alignment: AlignmentDirectional.topEnd,child: SmallText(text: "00:22",color: Colors.white,)),
//                         const SizedBox(height: 16,),
//                         // Align(alignment: Alignment.center,child: Column(children: [
//                         //   SmallText(text: "Didn’t receive OTP yet?",color: Colors.grey,),
//                         //   SmallText(text: "Resend code",textDecoration: TextDecoration.underline,color: AppColors.primary,fontWeight: FontWeight.w500,)
//                         // ],),),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               const TextSpan( text: "Didn’t receive OTP yet? ",style: TextStyle(fontSize: 12,color: Colors.white)),
//                               TextSpan( text: 'Resend code', style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),),
//                             ],
//                           ),
//                         ),
//
//                         const SizedBox(height: 72,),
//                         ButtonSingleAtom(status: controller.apiResponseOtp.status,widget: "VERIFY OTP",tap: (){
//                           controller.verifyOtp(mobileNumber);
//                         },)
//                       ],),
//                     )
//                   ],),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
