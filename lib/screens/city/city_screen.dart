import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/project_modules/post/controller_post_list.dart';
import 'package:civic_force/project_modules/post/post_main_list_widget.dart';
import 'package:civic_force/screens/analysis_screen/analysis_detail/analysis_detail_screen.dart';
import 'package:civic_force/screens/city/controller_city_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../common_widget/app_colors.dart';
import '../../common_widget/container_decorated.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key, this.cityName});
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerCity(cityName: cityName),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: cityName??"New Delhi"),
          body: GetBuilder(init: ControllerPostList(city: cityName),tag: "City",
            builder: (controllerPostList) {
              return SmartRefresher(controller: controllerPostList.refreshController,
                enablePullUp: controllerPostList.loadMore,
                onLoading: controllerPostList.fetchData,
                onRefresh: controllerPostList.refreshData,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      if(controller.listWithImage.isNotEmpty)SmallText(text: "Tags",fontWeight: FontWeight.w600,size: 16),
                      SizedBox(height: 16,),
                      SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child: Row(spacing: 16,children: [
                          // for(var x in [ "https://i.pinimg.com/1200x/62/31/41/623141fbb390209c9effd334a51db2b5.jpg","https://i.pinimg.com/1200x/00/a9/53/00a953273a1313f54350c7ee3e47fff4.jpg" ,"https://i.pinimg.com/1200x/5d/00/2e/5d002e8845ef4ad052b5b6432c87a2fa.jpg","https://i.pinimg.com/736x/3d/01/f1/3d01f126c608d7555c8a99f3163421f7.jpg" ,"https://i.pinimg.com/1200x/49/e2/4c/49e24cb0657ca40c77e8c6a6831b6af5.jpg"])
                          for(var x in controller.listWithImage)
                            InkWell(onTap: (){
                              Get.to(()=>AnalysisDetailScreen(tagName: x.name,));
                            },
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,children: [
                                ImageCommon( "${x.image}",height: 80,width:80,borderRadius: 10,),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,children: [
                                  SizedBox(width: 80,child: SmallText(text: "${x.name}",fontWeight: FontWeight.w500,maxLine: 2,overflow: TextOverflow.ellipsis,),),
                                  SmallText(text: "${x.postCount} case",fontWeight: FontWeight.w500,textAlign: TextAlign.center,size: 12,color: Colors.black54,),
                                ],),
                              ],),
                            )
                        ],),
                      ),

                      if(controller.listWithoutImage.isNotEmpty)Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        SizedBox(height: 36,),
                        SmallText(text: "Tags without image",fontWeight: FontWeight.w600,size: 16),
                        SizedBox(height: 16,),
                        Wrap(spacing: 8,runSpacing: 8,children: [
                          // for(var x in ['Water','Electricity','Garbage',"Air Quality","Road Accident"])
                          for(var x in controller.listWithoutImage)
                            ContainerDecorated(onTap: (){
                              Get.to(()=>AnalysisDetailScreen(tagName: x.name,));
                            },color: AppColors.primary.withOpacity(0.2),paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),borderRadius: 30,child: Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallText(text: "${x.name}",fontWeight: FontWeight.w600,),
                                SmallText(text: " (${x.postCount}K)",size: 12,fontWeight: FontWeight.w600,color: Colors.black54,)
                              ],
                            ))
                        ],),
                      ],),

                      SizedBox(height: 36,),
                      Row(spacing: 24,
                        children: [
                          InkWell(onTap: (){
                            controller.selectedTab=0;
                            controller.update();
                            controllerPostList.top=null;
                            controllerPostList.refreshData();
                          },
                            child: Row(spacing: 4,mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(children: [
                                  Row(spacing: 4,children: [
                                    SmallText(text: "Recent",fontWeight: FontWeight.w600,size: 16,)
                                  ],),
                                  SizedBox(height: 4,),
                                  Container(height: 2,width: 75,decoration: BoxDecoration(color: controller.selectedTab==0?Colors.black54:AppColors.scaffoldBackgroundColor,),)
                                ],)
                              ],
                            ),
                          ),
                          InkWell(onTap: (){
                            controller.selectedTab=1;
                            controller.update();
                            controllerPostList.top=true;
                            controllerPostList.refreshData();
                          },
                            child: Row(spacing: 4,mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(children: [
                                  Row(spacing: 4,children: [
                                    SmallText(text: "Top",fontWeight: FontWeight.w600,size: 16,)
                                  ],),
                                  SizedBox(height: 4,),
                                  Container(height: 2,width: 60,decoration: BoxDecoration(color: controller.selectedTab==1?Colors.black54:AppColors.scaffoldBackgroundColor,),)
                                ],)
                              ],
                            ),
                          ),


                        ],
                      ),

                      Divider(height: 1,),
                      SizedBox(height: 16,),
                      PostMainListWidget(city: controller.cityName,tag: "City",)
                    ],),
                  ),
                ),
              );
            }
          ),
        );
      }
    );
  }
}
