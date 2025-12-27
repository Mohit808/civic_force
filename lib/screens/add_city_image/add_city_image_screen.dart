import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/project_modules/city/city_main_widget.dart';
import 'package:civic_force/project_modules/city/near_by_city/near_by_city_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_widget/network_image_widget.dart';
import 'add_images/add_images_screen.dart';
import 'controller_add_city.dart';

class AddCityImageScreen extends StatelessWidget {
  const AddCityImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAddCity(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Add Image"),
          body: SmartRefresher(controller: controller.refreshController,
            enablePullUp: controller.loadMore,
            onLoading: controller.selectedTab==0?controller.fetchTagData:controller.fetchData,
            onRefresh: controller.refreshData,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  // Row(spacing: 16,children: [
                  //   Expanded(child: ContainerDecorated(padding: 12,child: SmallText(text: "City",textAlign: TextAlign.center,),)),
                  //   Expanded(child: ContainerDecorated(padding: 12,child: SmallText(text: "Tags",textAlign: TextAlign.center,),)),
                  // ],),

                  ContainerDecorated(padding: 2,
                    child: Row(spacing: 16,children: [
                      Expanded(child: ContainerDecorated(onTap: (){
                        controller.selectedTab=0;
                        controller.update();
                        controller.refreshData();
                      },color: controller.selectedTab==0?Colors.white:null,padding: 10,child: SmallText(text: "Tags",color: controller.selectedTab==0?Colors.black:Colors.black54,textAlign: TextAlign.center,),)),
                      Expanded(child: ContainerDecorated(onTap: (){controller.selectedTab=1;controller.update();controller.refreshData();},color:controller.selectedTab==1? Colors.white:null,padding: 10,child: SmallText(text: "City",color: controller.selectedTab==1?Colors.black:Colors.black54,textAlign: TextAlign.center,),)),
                    ],),
                  ),

                  SizedBox(height: 16,),

                  if(controller.selectedTab==0)ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.listTags.length,itemBuilder: (itemBuilder,index){
                    return ContainerDecorated(color: Colors.white,colorBorder: Colors.grey.shade300,onTap: (){
                      Get.to(()=>AddImagesScreen(name: controller.listTags[index].name,id: controller.listTags[index].id,))?.then((onValue){
                        if(onValue!=null){
                          controller.listTags[index].setImage=onValue;
                          controller.update();
                        }
                      });
                    },marginEdgeInsets: EdgeInsets.symmetric(vertical: 8),paddingEdgeInsets: EdgeInsets.only(left: 16,right: 0),
                      child: Row(children: [
                        Expanded(child: SmallText(text: "${controller.listTags[index].name}",fontWeight: FontWeight.w600,size: 16,)),
                        if(controller.listTags[index].image!=null && "${controller.listTags[index].image}".isNotEmpty)ImageCommon(controller.listTags[index].image??"",height: 100,width: 100,borderRadius: 20,),
                        if(controller.listTags[index].image==null || "${controller.listTags[index].image}".isEmpty)SizedBox(height: 100,width: 100,child: Column(spacing: 8,mainAxisAlignment: MainAxisAlignment.center,children: [
                          Icon(Icons.add),
                          SmallText(text: "Add Image",color: Colors.black87,)
                        ],),),
                      ],),
                    );
                  }),


                  if(controller.selectedTab==1)ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                    return ContainerDecorated(color: Colors.white,colorBorder: Colors.grey.shade300,onTap: (){
                      Get.to(()=>AddImagesScreen(name: controller.list[index].name,id: controller.list[index].id,isCity: true,))?.then((onValue){
                        if(onValue!=null){
                          controller.list[index].setImage=onValue;
                          controller.update();
                        }
                      });
                    },marginEdgeInsets: EdgeInsets.symmetric(vertical: 8),paddingEdgeInsets:  EdgeInsets.only(left: 16,right: 0),
                      child: Row(children: [
                        Expanded(child: SmallText(text: "${controller.list[index].name}",fontWeight: FontWeight.w600,size: 16,)),

                        if(controller.list[index].image!=null && "${controller.list[index].image}".isNotEmpty)ImageCommon(controller.list[index].image??"",height: 100,width: 100,borderRadius: 20,),
                        if(controller.list[index].image==null || "${controller.list[index].image}".isEmpty)SizedBox(height: 100,width: 100,child: Column(spacing: 8,mainAxisAlignment: MainAxisAlignment.center,children: [
                          Icon(Icons.add),
                          SmallText(text: "Add Image",color: Colors.black87,)
                        ],),),
                      ],),
                    );
                  }),



                ],),
              ),
            ),
          ),
        );
      }
    );
  }
}
