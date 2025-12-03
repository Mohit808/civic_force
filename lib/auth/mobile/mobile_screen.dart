//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../common_widget/app_bar.dart';
// import '../../common_widget/app_colors.dart';
// import '../../common_widget/button_single_atom.dart';
// import '../../common_widget/container_decorated.dart';
// import '../../common_widget/text_common.dart';
// import '../../common_widget/textfield_atom.dart';
// import '../../utils.dart';
// import 'controller_mobile.dart';
//
// class MobileScreen extends StatelessWidget {
//   const MobileScreen({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerMobile(),
//       builder: (controller) {
//
//         return Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBarCommon(title: "",titleColor: AppColors.primary,color: Colors.black,elevation: 0,colorIconTheme: Colors.white,),
//           body: SingleChildScrollView(
//             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(width: isMobile()?Get.width:Get.width/3,
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                         const SizedBox(height: 16,),
//                         Row(
//                           children: [
//                             const BigText20(text: "Login With ",color: Colors.white,),
//                             const BigText20(text: "Mobile Number",color: Colors.blue,),
//                           ],
//                         ),
//                         SizedBox(height: 16,),
//                         SmallText(text: "We will send a confirmation code to your phone",fontWeight: FontWeight.w600,color: Colors.white70,),
//                         const SizedBox(height: 48,),
//                         Form(key: controller.formKey,
//                           child: TextFieldCommon(colorHint: Colors.white,colorText: Colors.white,controller: controller.textEditingControllerMobile,validator: (value){
//                             if(value!.isEmpty) return "Enter number";
//                             if(value.length!=10) return "Invalid number";
//                             // if(!value.startsWith("9") || !value.startsWith("8") || !value.startsWith("7") || !value.startsWith("6")) return "Invalid number";
//                             return null;
//                           },hintText: "Enter number",keyboardType: TextInputType.number,fillColor: Colors.black,borderRadius: 4,prefixIcon: Row(spacing: 12,mainAxisSize: MainAxisSize.min,children: [
//                             SizedBox(),
//                             SmallText(text: "+91",color: Colors.white,),
//                             ContainerDecorated(height: 25,width: 1,color: Colors.grey,),
//                             SizedBox()
//                           ],),),
//                         ),
//                         const SizedBox(height: 72,),
//
//                         Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                           SizedBox(height: 24,width: 24,child: Checkbox(value: true, onChanged: (onChanged){})),
//                           const SizedBox(width: 16,),
//                           Expanded(
//                             child: Text.rich(
//                               TextSpan(
//                                 children: [
//                                   const TextSpan( text: 'By continuing, you agree to accept our ',style: TextStyle(fontSize: 12,color: Colors.white70)),
//                                   TextSpan( text: 'Privacy Policy', style: TextStyle(color: Colors.blue,fontSize: 12),),
//                                   const TextSpan( text: ' & ',style: TextStyle(fontSize: 12,color: Colors.white70)),
//                                   TextSpan( text: 'Terms of Services.', style: TextStyle(color: Colors.blue,fontSize: 12),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],),
//                         const SizedBox(height: 24,),
//                         ButtonSingleAtom(status: controller.apiResponse.status,color:AppColors.primary,widget: "Send OTP",tap: (){
//                           if(!controller.formKey.currentState!.validate()) return;
//                           controller.postData();
//                         },),
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