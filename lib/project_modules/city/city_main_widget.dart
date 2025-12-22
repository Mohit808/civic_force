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

          SizedBox(height: 150, child: SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(spacing: 8,children: [

                InkWell(onTap: (){
                  Get.to(()=>CityScreen(cityName: controller.cityDetails?.name,));
                },
                  child: Stack(
                    children: [
                      SizedBox(height: 150,width: 150,child: ImageCommon(src:  controller.cityDetails?.image?? "https://i.pinimg.com/736x/a1/8e/3b/a18e3b651fc065c5040f09108955430f.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                      Positioned(bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Container(height: 35,width: 150,
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
                SizedBox(height: 150,
                  child: GridView.builder(scrollDirection: Axis.horizontal,itemCount: controller.list.length,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,), itemBuilder: (itemBuilder,index){
                    return ImageCommon(height: 70,width: 70,src: controller.list[index].post?.image??"https://i.pinimg.com/1200x/b0/55/af/b055afbd910458f46eae8b141f48532f.jpg",fit: BoxFit.cover,borderRadius: 10,);
                  }),
                ),



                // Column(spacing: 8,
                //   children: [
                //     // Row(spacing: 8,
                //     //   children: [
                //     //     SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/1200x/b0/55/af/b055afbd910458f46eae8b141f48532f.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                //     //     SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/1200x/60/46/85/60468533b11c463694895c6e7003af14.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                //     //     SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/736x/eb/79/35/eb7935eb385628f9d1cefbd7c77e1202.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                //     //
                //     //   ],
                //     // ),
                //     // Row(spacing: 8,
                //     //   children: [
                //     //     SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/1200x/75/10/18/751018d0e55d0409cc1ff8880d34a95e.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                //     //     SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/736x/6e/91/55/6e91555d191d09d92ee2ef949d8e9089.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                //     //     SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/736x/b3/ad/3b/b3ad3bacde1436e5860fa06e21d5db79.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                //     //
                //     //   ],
                //     // ),
                //   ],
                // ),
                // SizedBox(width: 8,),
                InkWell(onTap: (){
                  Get.to(()=>CityScreen(cityName: controller.myCity,));
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
