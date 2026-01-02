// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../common_widget/app_bar.dart';
// import '../../../common_widget/app_colors.dart';
// import '../../../common_widget/container_decorated.dart';
// import '../../../common_widget/textfield_atom.dart';
// import '../../../network_handling/api_response.dart';
// import '../controller_main_story.dart';
//
// class StoryAddScreen extends StatelessWidget {
//   StoryAddScreen({super.key, this.path});
//   final String? path;
//
//   TextEditingController textEditingController=TextEditingController();
//   String status="public";
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerMainStory(),
//       builder: (controller) {
//         return Scaffold(
//           appBar: AppBarCommon(title: "Add Story",color: AppColors.primary),
//           body: Stack(children: [
//             Center(child: Image.file(File(path!),fit: BoxFit.cover,)),
//             Positioned(bottom: 16,left: 16,right:16,child: Column(children: [
//               // TextFieldCommon(controller: textEditingController,onChanged: (text){
//               //   controller.update();
//               // },BorderColor: Colors.transparent,hintText: "Add a caption...".tr,borderRadius: 30,fillColor: Color(
//               //     0xFF3A3838),colorText: Colors.white,colorHint: Colors.white.withOpacity(0.5),),
//               SizedBox(height: 16,),
//               Row(spacing: 16,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
//
//                 Expanded(
//                   child: TextFieldCommon(controller: textEditingController,onChanged: (text){
//                     controller.update();
//                   },BorderColor: Colors.transparent,hintText: "Add a caption...".tr,borderRadius: 30,fillColor: AppColors.primary.withOpacity(0.2),),
//                 ),
//
//
//                 // PopupMenuButton(color: Color(0xFF252525),child: ContainerDecorated(color: Color(0xFF4A4A4A),
//                 //   child: Row(spacing: 4,children: [
//                 //     Icon(Icons.history_toggle_off_sharp,size: 16,color: Colors.white70,),
//                 //     SmallText(text: "Status ($status)",fontWeight: FontWeight.w600,color: Colors.white70,),
//                 //   ],),
//                 // ),itemBuilder: (itemBuilder){
//                 //   return [
//                 //     PopupMenuItem(onTap: (){
//                 //       status="public";
//                 //       controller.update();
//                 //     },child: Row(spacing: 8,
//                 //       children: [
//                 //         Icon(Icons.language,size: 16,color: Colors.green,),
//                 //         SmallText(text: "Public",color: Colors.green,),
//                 //       ],
//                 //     )),
//                 //     PopupMenuItem(onTap: (){
//                 //       status="contacts";
//                 //       controller.update();
//                 //     },child: Row(spacing: 8,
//                 //       children: [
//                 //         Icon(Icons.contact_mail_outlined,size: 16,color: Colors.green,),
//                 //         SmallText(text: "Contacts",color: Colors.green,),
//                 //       ],
//                 //     )),
//                 //   ];
//                 // }),
//                 ContainerDecorated(onTap: (){
//                   controller.storyFunction(path: path,text: textEditingController.text,status: status);
//                 },color: AppColors.primary,borderRadius: 30,padding: 10,child: controller.apiResponseUploading.status==Status.LOADING?SizedBox(height: 24,width: 24,child: CircularProgressIndicator(strokeWidth: 2,color: Colors.white,)): Icon(Icons.send,color: Colors.white,))
//               ],),
//               SizedBox(height: 8,),
//
//             ],),)
//           ],),
//         );
//       }
//     );
//   }
// }
