import 'dart:ui';

import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/screens/analysis_screen/analysis_detail/analysis_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/network_image_widget.dart';
import '../../common_widget/text_common.dart';
import '../../screens/city/city_screen.dart';
import 'controllerCityMain.dart';

class CityMainWidget extends StatelessWidget {
  const CityMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerCityMain(),
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

          SizedBox(height: 200, child: SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(spacing: 8,children: [

                InkWell(onTap: (){
                  Get.to(()=>CityScreen(cityName: controller.cityDetails?.name,));
                },
                  child: Stack(
                    children: [
                      SizedBox(height: 200,width: 200,child: ImageCommon(src:  controller.cityDetails?.image?? "https://i.pinimg.com/736x/a1/8e/3b/a18e3b651fc065c5040f09108955430f.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                      Positioned(bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Container(height: 35,width: 170,
                              color: Colors.black.withOpacity(0.1),
                              padding: EdgeInsets.only(top: 8,left: 8),
                              child: SmallText(text: controller.cityDetails?.name?? "Prayagraj",color: Colors.white,fontWeight: FontWeight.w700,size: 13,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 200,
                  child: GridView.builder(scrollDirection: Axis.horizontal,itemCount: controller.list.length,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,), itemBuilder: (itemBuilder,index){
                    return Stack(
                      children: [
                        AspectRatio(aspectRatio: 1, child: ImageCommon(src: controller.list[index].post?.image??"https://i.pinimg.com/1200x/b0/55/af/b055afbd910458f46eae8b141f48532f.jpg",fit: BoxFit.cover,borderRadius: 10,)),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Material(elevation: 2,borderRadius: BorderRadius.circular(20),child: ImageCommon(src: "${controller.list[index].post?.user?.image}",height: 24,width: 24,borderRadius: 20,fit: BoxFit.cover,)),
                        )
                      ],
                    );
                  }),
                ),

                if(controller.list.length>9)InkWell(onTap: (){
                  Get.to(()=>CityScreen(cityName: myCity,));
                },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_right,color: Colors.blue,),
                      SmallText(text: "See All",fontWeight: FontWeight.w600,color: Colors.blue,),
                    ],
                  ),
                ),

              ],),
            ),),

          SizedBox(height: 16,),
          SingleChildScrollView(scrollDirection: Axis.horizontal,
            child: Row(spacing: 8,children: [
              for(var x in controller.list)
                ContainerDecorated(onTap: (){
                  Get.to(()=>AnalysisDetailScreen(tagName: x.name,));
                },color: Colors.transparent,colorBorder: Colors.grey,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 14,vertical: 8),borderRadius: 30,child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: "${x.name}",fontWeight: FontWeight.w500,size: 13,),
                    SmallText(text: " (${x.postCount})",size: 12,fontWeight: FontWeight.w600,)
                  ],
                ))
            ],),
          ),

        ],);
      }
    );
  }
}
