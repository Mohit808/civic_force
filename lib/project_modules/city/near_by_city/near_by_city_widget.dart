import 'dart:ui';

import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/screens/city/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';
import '../../../screens/add_city_image/add_images/add_images_screen.dart';
import 'controller_near_by_city.dart';

class NearByCityWidget extends StatelessWidget {
  const NearByCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerNearByCity(),
      builder: (controller) {
        return SizedBox(height: 220,
          child: GridView.builder(itemCount: controller.list.length,shrinkWrap: true,scrollDirection: Axis.horizontal,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16), itemBuilder: (itemBuilder,index){
            return InkWell(onTap: (){
              Get.to(()=>CityScreen(cityName: controller.list[index].name,));
            },
              child: Stack(
                children: [
                  if(controller.list[index].image!=null && "${controller.list[index].image}".isNotEmpty)ImageCommon(height: 100,width: 100,fit: BoxFit.cover,borderRadius: 10,src: controller.list[index].image??""),
                  if(controller.list[index].image==null || "${controller.list[index].image}".isEmpty)ImageCommon(height: 100,width: 100,fit: BoxFit.cover,borderRadius: 10,src: "https://i.pinimg.com/736x/96/44/e7/9644e7c7359295843c78482739176242.jpg"),
                  if(controller.list[index].image==null || "${controller.list[index].image}".isEmpty)Container(height: 100,width: 100,child: Column(spacing: 2,mainAxisAlignment: MainAxisAlignment.center,children: [
                    Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.3))
                    ]),
                      child: InkWell(onTap: (){
                        Get.to(()=>AddImagesScreen(name: controller.list[index].name,id: controller.list[index].id,isCity: true,));
                      },
                        child: Column(mainAxisSize: MainAxisSize.min,children: [
                          Icon(Icons.add,color: Colors.white,),
                          // SmallText(text: "Add Image",size: 12,color: Colors.white,fontWeight: FontWeight.w800,),
                          // SizedBox(height: 8,)
                        ],),
                      ),
                    )
                  ],),),
                  Positioned(bottom: 0, child: ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(height: 25,width: 100, color: Colors.black.withOpacity(0.1), padding: EdgeInsets.only(top: 4,left: 4),
                          child: SmallText(text: controller.list[index].name?? "Prayagraj",color: Colors.white,fontWeight: FontWeight.w700,size: 12,maxLine: 1,overflow: TextOverflow.ellipsis,),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        );

        //   SingleChildScrollView(scrollDirection: Axis.horizontal,
        //   child: Column(children: [
        //     Row(spacing: 16,
        //       children: [
        //         SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/68/3b/50/683b50b794d06988e57e6b8a3a63bd1e.jpg",fit: BoxFit.cover,borderRadius: 10),),
        //         SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/9d/2a/6e/9d2a6e386f606e7f8198fc87e4af5c44.jpg",fit: BoxFit.cover,borderRadius: 10),),
        //         SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/1200x/5d/00/2e/5d002e8845ef4ad052b5b6432c87a2fa.jpg",fit: BoxFit.cover,borderRadius: 10),),
        //         SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/63/95/01/639501272f8a350415fac4d7b78014ab.jpg",fit: BoxFit.cover,borderRadius: 10),),
        //       ],
        //     ),
        //     SizedBox(height: 16,),
        //     Row(spacing: 16,
        //       children: [
        //         SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/1200x/c1/51/b1/c151b141f2d7169dcdacb5b9a1a86964.jpg",fit: BoxFit.cover,borderRadius: 10),),
        //         SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/4d/82/5a/4d825a0ea3706c2f60bce25526ebe31d.jpg",fit: BoxFit.cover,borderRadius: 10),),
        //         SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/61/2b/3a/612b3aa25e0c4fd49180b116934565fd.jpg",fit: BoxFit.cover,borderRadius: 10),),
        //         SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/1200x/62/31/41/623141fbb390209c9effd334a51db2b5.jpg",fit: BoxFit.cover,borderRadius: 10),),
        //       ],
        //     ),
        //   ],),
        // );

      }
    );
  }
}
