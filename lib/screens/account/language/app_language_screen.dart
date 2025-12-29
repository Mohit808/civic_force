import 'package:civic_force/common_widget/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/app_bar.dart';
import '../../../common_widget/button_single_atom.dart';
import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/text_common.dart';
import 'controller_app_language.dart';

class AppLanguageScreen extends StatelessWidget {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAppLanguage(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Language"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                SmallText(text: "Select language",size: 18,fontWeight: FontWeight.w600,),
                SizedBox(height: 16,),

                ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                  return ContainerDecorated(onTap: (){
                    controller.selectedIndex=index;
                    controller.update();
                  },marginEdgeInsets: EdgeInsets.only(bottom: 16),colorBorder: controller.selectedIndex==index?Colors.green:  Colors.white30,padding: 16,child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
                          SmallText(text: "${controller.list[index]['t1']}",fontWeight: FontWeight.w600,size: 16),
                          SmallText(text: "${controller.list[index]['t2']}",),
                          SmallText(text: "${controller.list[index]['t3']}",color: AppColors.primary)
                        ],),
                      ),
                      ContainerDecorated(height: 35,width: 35,color: controller.selectedIndex==index?Colors.green: Colors.grey,borderRadius: 30,child: Center(child: SmallText(text: "${controller.list[index]['t4']}",fontWeight: FontWeight.w600,size: 16,color: Colors.white,)))
                    ],
                  ),);
                })
              ],),
            ),
          ),
          persistentFooterButtons: controller.selectedIndex== -1?null: [
            ButtonSingleAtom(tap: (){
              controller.changeLanguage(controller.list[controller.selectedIndex]['code']);
              Get.back();
            },widget: SmallText(text: "Confirm",color: Colors.white,size: 18,fontWeight: FontWeight.w600,),)
          ],
        );
      }
    );
  }


}
