import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/screens/analysis_screen/analysis_detail/analysis_detail_screen.dart';
import 'package:civic_force/screens/map/controller_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_widget/container_decorated.dart';
import '../../common_widget/network_image_widget.dart';
import '../../common_widget/text_common.dart';
import '../../project_modules/city/city_main_widget.dart';
import 'controller_analysis.dart';

class Analysis2Screen extends StatelessWidget {
  const Analysis2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAnalysis(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Analysis"),
          body: SmartRefresher(controller: controller.refreshController,
            enablePullUp: controller.loadMore,
            onRefresh: controller.refreshData,
            onLoading: controller.fetchData,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                  SmallText(text: "In your city",fontWeight: FontWeight.w600,size: 16,),
                  SmallText(text: "City wise data",color: Colors.black54,),
                  SizedBox(height: 16,),
                  CityMainWidget(),

                  SizedBox(height: 36,),
                  SmallText(text: "Near By Cities",fontWeight: FontWeight.w600,size: 16,),
                  SmallText(text: "City wise data",color: Colors.black54,),
                  SizedBox(height: 16,),

                  SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Column(children: [
                      Row(spacing: 16,
                        children: [
                          SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/68/3b/50/683b50b794d06988e57e6b8a3a63bd1e.jpg",fit: BoxFit.cover,borderRadius: 10),),
                          SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/9d/2a/6e/9d2a6e386f606e7f8198fc87e4af5c44.jpg",fit: BoxFit.cover,borderRadius: 10),),
                          SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/1200x/5d/00/2e/5d002e8845ef4ad052b5b6432c87a2fa.jpg",fit: BoxFit.cover,borderRadius: 10),),
                          SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/63/95/01/639501272f8a350415fac4d7b78014ab.jpg",fit: BoxFit.cover,borderRadius: 10),),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(spacing: 16,
                        children: [
                          SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/1200x/c1/51/b1/c151b141f2d7169dcdacb5b9a1a86964.jpg",fit: BoxFit.cover,borderRadius: 10),),
                          SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/4d/82/5a/4d825a0ea3706c2f60bce25526ebe31d.jpg",fit: BoxFit.cover,borderRadius: 10),),
                          SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/736x/61/2b/3a/612b3aa25e0c4fd49180b116934565fd.jpg",fit: BoxFit.cover,borderRadius: 10),),
                          SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/1200x/62/31/41/623141fbb390209c9effd334a51db2b5.jpg",fit: BoxFit.cover,borderRadius: 10),),
                        ],
                      ),
                    ],),
                  ),

                  SizedBox(height: 36,),
                  Divider(),
                  SizedBox(height: 24,),

                  SmallText(text: "Reports",fontWeight: FontWeight.w600,size: 16,),
                  SmallText(text: "Top reported data",color: Colors.black54,),
                  SizedBox(height: 16,),

                  ListView.separated(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length, itemBuilder: (itemBuilder,index){
                    return

                      Container(decoration: BoxDecoration(color: hexToColor(controller.list[index].color??"#ff595e").withOpacity(0.1),borderRadius: BorderRadius.circular(10)
                        // image: DecorationImage(image: AssetImage(AppImages.healthcare))
                      ),
                        child: Row(children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                                SmallText(text: "${controller.list[index].name}",color: hexToColor(controller.list[index].color??"#ff595e"),size: 18,fontWeight: FontWeight.w600,),
                                SmallText(text: "${controller.list[index].postCount} case reported",color:  hexToColor(controller.list[index].color??"#ff595e"),),
                                ContainerDecorated(onTap: (){
                                  Get.to(()=>AnalysisDetailScreen());
                                },borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 4),color:  hexToColor(controller.list[index].color??"#ff595e"),child: Row(spacing: 4,mainAxisSize: MainAxisSize.min,children: [
                                  SmallText(text: "View",color: Colors.white,fontWeight: FontWeight.w600,size: 11,),
                                  Icon(Icons.arrow_forward,size: 16,color: Colors.white,),
                                ],),)
                              ],),
                            ),
                          ),

                          // Image.asset(listIcon[index],height: 100,width: 100,),

                        ],),
                      );

                    //   ContainerDecorated(child: Row(spacing: 16,
                    //   children: [
                    //     Image.asset(AppImages.healthcare,height: 70,width: 70,),
                    //     Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         SmallText(text: list[index],fontWeight: FontWeight.w600,size: 16,),
                    //         SmallText(text:"100 Reported",fontWeight: FontWeight.w500,size: 10,),
                    //       ],
                    //     ),
                    //   ],
                    // ),);
                  }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 36,); },),

                ],),
              ),
            ),
          ),
        );
      }
    );
  }
}
