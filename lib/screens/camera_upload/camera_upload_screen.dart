import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/screens/camera_upload/controller_camera_upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraUploadScreen extends StatelessWidget {
  const CameraUploadScreen({super.key, this.image});
  final dynamic image;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerCameraUpload(),
      builder: (controller) {
        return Scaffold(
          // appBar: AppBarCommon(title: "",height: 0,color: AppColors.scaffoldBackgroundColor,),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(children: [
                  ImageCommon(src: image),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(spacing: 16,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldCommon(hintText: "Enter issue label",suffixIcon: ContainerDecorated(onTap: (){
                          if(controller.textEditingControllerLabel.text.isEmpty) return;
                          controller.selectedIssue=controller.textEditingControllerLabel.text;
                          controller.update();
                        },borderRadius: 8,margin: 2,color: Colors.deepPurple,child: Icon(Icons.add,color: Colors.white,),),onFieldSubmitted: (value){
                          if(value.isNotEmpty){
                            controller.selectedIssue=value;
                            controller.update();
                          }
                        },),
                        if(controller.selectedIssue!=null) ContainerDecorated(onTap: (){
                          controller.selectedIssue=null;
                          controller.update();
                        },color: Colors.transparent,colorBorder: Colors.grey.shade400,paddingEdgeInsets: EdgeInsets.only(left: 12,top: 6,bottom: 6,right: 8),child: Row(mainAxisSize: MainAxisSize.min,spacing: 4,
                          children: [
                            SmallText(text: controller.selectedIssue??""),
                            Icon(Icons.close,size: 16,)
                          ],
                        ),),
                        TextFieldCommon(hintText: "Enter your issue here..."),
                        Row(spacing: 10,children: [
                          Icon(Icons.info_outline_rounded,size: 18,color: Colors.black54,),
                          SmallText(text: "post on map only applied!",color: Colors.black54,)
                        ],)
                      ],
                    ),
                  ),
                ],),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 55),
                child: ContainerDecorated(onTap: (){
                  Get.back();
                },color: Colors.black54,child: Icon(Icons.arrow_back,color: Colors.white,)),
              ),



            ],
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(widget: "Submit",)
          ],
        );
      }
    );
  }
}
