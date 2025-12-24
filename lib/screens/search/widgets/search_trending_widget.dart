import 'package:civic_force/screens/analysis_screen/analysis_detail/analysis_detail_screen.dart';
import 'package:civic_force/screens/search/controller_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/text_common.dart';

class SearchTrendingWidget extends StatelessWidget {
  const SearchTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSearch(),
      builder: (controller) {
        return controller.trendingTagsModel==null?SizedBox():Column(spacing: 24,crossAxisAlignment: CrossAxisAlignment.start,children: [
          SmallText(text: "Trending",fontWeight: FontWeight.w600,size: 18,letterSpacing: 1.5,),

          if(controller.trendingTagsModel?.topTrending!=null)InkWell(onTap: (){
            Get.to(()=>AnalysisDetailScreen(tagName: controller.trendingTagsModel?.topTrending?.name));
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
              SmallText(text: "Top Trending",color: Colors.black54,size: 15,),
              SmallText(text: "${controller.trendingTagsModel?.topTrending?.name}",fontWeight: FontWeight.w600,size: 16,),
              SmallText(text: "${controller.trendingTagsModel?.topTrending?.postCount} posts",color: Colors.black54,),
            ],),
          ),

          if(controller.trendingTagsModel?.trendingInYourCity!=null)InkWell(onTap: (){
            Get.to(()=>AnalysisDetailScreen(tagName: controller.trendingTagsModel?.trendingInYourCity?.name));
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
              SmallText(text: "Trending in your city",color: Colors.black54,size: 15,),
              SmallText(text: "${controller.trendingTagsModel?.trendingInYourCity?.name}",fontWeight: FontWeight.w600,size: 16,),
              SmallText(text: "${controller.trendingTagsModel?.trendingInYourCity?.postCount} posts",color: Colors.black54,),
            ],),
          ),

          if(controller.trendingTagsModel?.trendingInYourCountry!=null)InkWell(onTap: (){
            Get.to(()=>AnalysisDetailScreen(tagName: controller.trendingTagsModel?.trendingInYourCountry?.name));
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
              SmallText(text: "Trending in your country",color: Colors.black54,size: 15,),
              SmallText(text: "${controller.trendingTagsModel?.trendingInYourCountry?.name}",fontWeight: FontWeight.w600,size: 16,),
              SmallText(text: "${controller.trendingTagsModel?.trendingInYourCountry?.postCount} posts",color: Colors.black54,),
            ],),
          ),

          if(controller.trendingTagsModel?.trendingAroundTheWorld!=null)InkWell(onTap: (){
            Get.to(()=>AnalysisDetailScreen(tagName: controller.trendingTagsModel?.trendingAroundTheWorld?.name));
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
              SmallText(text: "Trending around world",color: Colors.black54,size: 15,),
              SmallText(text: "${controller.trendingTagsModel?.trendingAroundTheWorld?.name}",fontWeight: FontWeight.w600,size: 16,),
              SmallText(text: "${controller.trendingTagsModel?.trendingAroundTheWorld?.postCount} posts",color: Colors.black54,),
            ],),
          ),

        ],);
      }
    );
  }
}
