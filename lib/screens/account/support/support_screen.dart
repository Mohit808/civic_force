// import 'package:civic_force/common_widget/app_bar.dart';
// import 'package:civic_force/common_widget/container_decorated.dart';
// import 'package:civic_force/common_widget/network_image_widget.dart';
// import 'package:civic_force/common_widget/text_common.dart';
// import 'package:civic_force/utils/app_images.dart';
// import 'package:dotlottie_loader/dotlottie_loader.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
//
// import '../feedback/feedback_screen.dart';
//
// class SupportScreen extends StatelessWidget {
//   const SupportScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarCommon(title: "Support and Feedback"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(spacing: 16,children: [
//
//           Container(constraints: BoxConstraints(maxHeight: 250),
//             child: DotLottieLoader.fromAsset(AppImages.callCenter, frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
//               if (dotlottie != null) {
//                 return Lottie.memory(dotlottie.animations.values.single);
//               } else {
//                 return Container();
//               }
//             }),
//           ),
//
//           SizedBox(height: 16,),
//
//           InkWell(onTap: (){
//             Get.to(()=>FeedbackScreen());
//           },child: Row(spacing: 16,
//             children: [
//               ContainerDecorated(padding: 10,borderRadius: 30,child: Icon(Icons.rate_review_outlined)),
//               Expanded(child: SmallText(text: "Feedback",fontWeight: FontWeight.w600,size: 15,)),
//               Icon(Icons.keyboard_arrow_right_rounded,size: 20,)
//             ],
//           )),
//
//           Divider(),
//           InkWell(onTap: (){
//             Get.to(()=>FeedbackScreen());
//           },child: Row(spacing: 16,
//             children: [
//               ContainerDecorated(padding: 10,borderRadius: 30,child: Icon(Icons.support_agent)),
//               Expanded(child: SmallText(text: "Contact Live Support",fontWeight: FontWeight.w600,size: 15,)),
//               Icon(Icons.keyboard_arrow_right_rounded,size: 20,)
//             ],
//           )),
//
//           Divider(),
//
//           InkWell(onTap: (){
//             Get.to(()=>FeedbackScreen());
//           },child: Row(spacing: 16,
//             children: [
//               ContainerDecorated(padding: 10,borderRadius: 30,child: Icon(Icons.live_help_outlined)),
//               Expanded(child: SmallText(text: "FAQ's",fontWeight: FontWeight.w600,size: 15,)),
//               Icon(Icons.keyboard_arrow_right_rounded,size: 20,)
//             ],
//           )),
//
//
//         ],),
//       ),
//     );
//   }
// }
