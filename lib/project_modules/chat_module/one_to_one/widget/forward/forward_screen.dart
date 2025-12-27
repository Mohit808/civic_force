import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/project_modules/chat_module/controller_chat_list.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_forward.dart';

class ForwardScreen extends StatelessWidget {
  const ForwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerChatList(),
        builder: (controllerChatList) {
          return GetBuilder(init: ControllerForward(),
              builder: (controllerForward) {
                return Scaffold(
                  appBar: AppBarCommon(title: "Forward"),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [

                      ListView.separated(shrinkWrap: true,itemCount: controllerChatList.list.length,itemBuilder: (itemBuilder,index){
                        return InkWell(onTap: (){
                          if(controllerForward.listSelected.contains(controllerChatList.list[index])){
                            controllerForward.listSelected.remove(controllerChatList.list[index]);
                          }else{
                            controllerForward.listSelected.add(controllerChatList.list[index]);
                          }
                          controllerForward.update();
                        },
                          child: Row(spacing: 16,
                            children: [
                              ImageCommon("${controllerChatList.list[index].image}",sizeAndCircle: 50),
                              Expanded(child: SmallText(text: "${controllerChatList.list[index].name}",size: 15,fontWeight: FontWeight.w600,)),
                              Radio(value: controllerForward.listSelected.contains(controllerChatList.list[index]),groupValue: true,onChanged: null,)
                            ],
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) { return Divider(); },)

                    ],),
                  ),
                  persistentFooterButtons:  controllerForward.listSelected.isEmpty?null:[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                      child: Row(children: [
                        Expanded(child: SmallText(text: controllerForward.listSelected.map((toElement)=>toElement.name).toList().join(","),fontWeight: FontWeight.w500,)),
                        ContainerDecorated(onTap: (){

                          controllerForward.forwardMessage(controllerChatList);
                        },color: AppColors.primary,padding: 8,borderRadius: 30,child: ImageCommon(AppImages.message,size: 24,color: Colors.white,))
                      ],),
                    )
                  ],
                );
              }
          );
        }
    );
  }
}
