

import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/screens/city/city_screen.dart';
import 'package:civic_force/screens/search/controller_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPlacesWidget extends StatelessWidget {
  const SearchPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSearch(),
      builder: (controller) {
        return ListView.separated(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.listCity.length,itemBuilder: (itemBuilder,index){
          return InkWell(onTap: (){
            Get.to(()=>CityScreen(cityName: controller.listCity[index].name,));
          },
            child: Row(spacing: 16,children: [
              if(controller.listCity[index].image==null || controller.listCity[index].image!.isEmpty)ContainerDecorated(borderRadius: 30,padding: 12,child: Icon(Icons.location_on_outlined)),
              if(controller.listCity[index].image!=null && controller.listCity[index].image!.isNotEmpty)ImageCommon(src: controller.listCity[index].image??"",borderRadius: 30,height: 50,width: 50,fit: BoxFit.cover,),
              Expanded(
                child: Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,children: [
                  SmallText(text: "City",color: Colors.black54,fontWeight: FontWeight.w500,),
                  SmallText(text: "${controller.listCity[index].name}",fontWeight: FontWeight.w600,size: 16,maxLine: 2,),
                  SmallText(text: "${controller.listCity[index].postCount} posts",color: Colors.black54,),
                ],),
              )
            ],),
          );
        }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },);
      }
    );
  }
}
