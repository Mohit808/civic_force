import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/screens/map/controller_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_widget/container_decorated.dart';
import '../../common_widget/text_common.dart';
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
                child: Column(children: [

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
                                ContainerDecorated(borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 4),color:  hexToColor(controller.list[index].color??"#ff595e"),child: Row(spacing: 4,mainAxisSize: MainAxisSize.min,children: [
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
