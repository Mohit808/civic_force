
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/data_source/data_source_common.dart';
import 'package:civic_force/screens/analysis_screen/analysis_detail/analysis_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller_search.dart';

class SearchTagsWidget extends StatelessWidget {
  const SearchTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSearch(),
      builder: (controller) {
        return ListView.separated(itemCount: controller.listTags.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (itemBuilder,index){
          return InkWell(onTap: (){
            Get.to(()=>AnalysisDetailScreen(tagName: controller.listTags[index].name,));
          },
            child: Row(spacing: 16,children: [
              ContainerDecorated(borderRadius: 30,padding: 8,child: Icon(Icons.tag),),
              Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                SmallText(text: "#${controller.listTags[index].name}",fontWeight: FontWeight.w600,size: 16,),
                SmallText(text: "${controller.listTags[index].postCount} posts",color: Colors.black54,),
              ],)
            ],),
          );
        }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },);
      }
    );
  }
}
