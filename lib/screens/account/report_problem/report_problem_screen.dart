import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/button_single_atom.dart';
import '../../../common_widget/textfield_atom.dart';
import 'controller_report_problem.dart';

class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerReportProblem(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Report Problem"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                ContainerDecorated(padding: 24,color:Colors.transparent,colorBorder: Colors.grey.shade300,
                  child: Row(children: [
                    Expanded(
                      child: Column(spacing: 12,
                        children: [
                          ContainerDecorated(borderRadius: 50,padding: 16,child: Icon(Icons.support_agent_rounded,size: 50,)),
                          SmallText(text: "We're Here to Help",size: 24,fontWeight: FontWeight.w600,),
                          SmallText(text: "Tell us what went wrong and we'll fix it",color: Colors.black54,),

                        ],
                      ),
                    )
                  ],),
                ),
                SizedBox(height: 24,),
                SmallText(text: "What type of problem are you having?",fontWeight: FontWeight.w600,color: Colors.black54,size: 15,),
                SizedBox(height: 24,),

                GridView.builder(physics: NeverScrollableScrollPhysics(),itemCount: controller.list.length,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 8,mainAxisSpacing: 8), itemBuilder: (itemBuilder,index){
                  return ContainerDecorated(onTap: (){
                    controller.selectedIndex=index;
                    controller.update();

                    Scrollable.ensureVisible(
                      controller.globalKey.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      alignment: 0.1, // 0 = top, 1 = bottom
                    );

                  },paddingEdgeInsets: EdgeInsets.only(top: 16,left: 16,right: 16),colorBorder: controller.selectedIndex==index?AppColors.primary: Colors.grey.shade300,color: Colors.transparent,child: Column(spacing: 8,children: [
                    ContainerDecorated(padding: 16,borderRadius: 30,child: Icon(controller.list[index]['icon'],size: 30,),),
                    SmallText(text: "${controller.list[index]['title']}",fontWeight: FontWeight.w600,size: 16,),
                    SmallText(text: "${controller.list[index]['subtitle']}",textAlign: TextAlign.center,color: Colors.black54,)
                  ],),);
                }),

                SizedBox(height: 24,),
                Divider(),

                SizedBox(height: 24,),
                SmallText(key: controller.globalKey,text: "Write you issue to better understanding",fontWeight: FontWeight.w600,size: 15,color: Colors.black54,),


                SizedBox(height: 16,),
                TextFieldCommon(maxLength: 1000,maxLines: 10,onChanged: (text){
                  controller.update();
                },BorderColor: Colors.transparent,hintText: "Enter you issue...".tr,borderRadius: 10,),
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
                SizedBox(height: 24,),
                ButtonSingleAtom(tap: (){

                },widget: "Submit",color: controller.textEditingController.text.isEmpty?Colors.grey:Colors.green,)


              ],),
            ),
          ),
        );
      }
    );
  }
}
