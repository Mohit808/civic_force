import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/app_bar.dart';
import '../../../common_widget/button_single_atom.dart';
import '../../../common_widget/text_common.dart';
import '../../../common_widget/textfield_atom.dart';
import 'controller_feedback.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerFeedback(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Feedback",),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              SmallText(text: "How are you feeling today",size: 18,fontWeight: FontWeight.w600,),
              SizedBox(height: 16,),
              SmallText(text: "Your input is valuable is helping us better understand your needs and tailor our service accordingly",),
              SizedBox(height: 24,),
              Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400),borderRadius: BorderRadius.circular(10)),
                child: TextFieldCommon(maxLength: 1000,maxLines: 10,controller: controller.textEditingController,onChanged: (text){
                  controller.update();
                },BorderColor: Colors.transparent,hintText: "Enter you feedback...".tr,borderRadius: 10,fillColor: Colors.white),
              ),
              SizedBox(height: 8,),
              Row(spacing: 16,children: [
                ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 10,vertical: 8),borderRadius: 30,colorBorder: Colors.grey.shade400,
                  child: Row(spacing: 8,children: [
                    Icon(Icons.image_outlined,size: 16,),
                    SmallText(text: "Image",fontWeight: FontWeight.w500,)
                  ],),
                ),
                ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 10,vertical: 8),borderRadius: 30,colorBorder: Colors.grey.shade400,
                  child: Row(spacing: 8,children: [
                    Icon(Icons.file_present,size: 16,),
                    SmallText(text: "File",fontWeight: FontWeight.w500,)
                  ],),
                ),
              ],),
              SizedBox(height: 48,),
              ButtonSingleAtom(tap: (){
                controller.postData();
              },widget: "Submit",color: controller.textEditingController.text.isEmpty?Colors.grey:Colors.green,)


            ],),

          ),
        );
      }
    );
  }
}
