import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_add_city.dart';

class AddCityImageScreen extends StatelessWidget {
  const AddCityImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAddCity(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Add Image"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Row(spacing: 16,children: [
                  Expanded(child: ContainerDecorated(padding: 12,child: SmallText(text: "City",textAlign: TextAlign.center,),)),
                  Expanded(child: ContainerDecorated(padding: 12,child: SmallText(text: "Tags",textAlign: TextAlign.center,),)),
                ],),
                SizedBox(height: 16,),
                ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                  return ContainerDecorated(marginEdgeInsets: EdgeInsets.symmetric(vertical: 8),padding: 8,
                    child: Row(children: [
                      Expanded(child: SmallText(text: "${controller.list[index].name}",fontWeight: FontWeight.w600,size: 16,)),
                      ContainerDecorated(child: Icon(Icons.add_a_photo_outlined),)
                    ],),
                  );
                })
              ],),
            ),
          ),
        );
      }
    );
  }
}
