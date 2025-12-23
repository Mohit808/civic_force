import 'package:flutter/material.dart';
import '../../../common_widget/text_common.dart';

class SearchTrendingWidget extends StatelessWidget {
  const SearchTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      SmallText(text: "Trending",fontWeight: FontWeight.w600,size: 18,letterSpacing: 1.5,),
      SizedBox(height: 16,),
      ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 4,itemBuilder: (itemBuilder,index){
        return Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
          SmallText(text: "Trending in your city",color: Colors.black54,size: 15,),
          SmallText(text: "Air Quality",fontWeight: FontWeight.w600,size: 16,),
          SmallText(text: "55.8K posts",color: Colors.black54,),
        ],);
      }, separatorBuilder: (BuildContext context, int index) { return Divider(); },),
    ],);
  }
}
